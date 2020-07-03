a<-1.5
b<--3
int<-6.2
library(mvtnorm)

name1<-paste('leverage_mean_',index,'.txt', sep = '')
name2<-paste('leverage_median_',index,'.txt', sep = '')
beta1<-c(int, a)
beta2<-c(int, b)
##############################
#### step 1, data generation
#############################


######################################################
####### select parameter #############################
p<-percentage #### contamination rate #######################
how_many<-2 ###### how many points from each individual 
######################################################


N<-500	##sample size
T<-5	##time points
NT<-N*T

lambda<-matrix(c(rep(1,T),seq(0,T-1,1)),T,2)
mu1<-lambda%*%beta1
mu2<-lambda%*%beta2

u<-rmvnorm(N,c(0,0), array(c(0.5,0,0,0.1), dim=c(2,2)))
varE<-0.1
## d1:asymmetric outlier
e<-matrix(rnorm(NT, 0, sqrt(varE)), ncol = T, nrow = N)
y_asym<-matrix(rep(mu1,N),N,T,byrow=TRUE)+t(lambda%*%t(u))+e
y_asym2<-matrix(rep(mu2,N),N,T,byrow=TRUE)+t(lambda%*%t(u))+e
#### random sample which person is to have outlier
which_out<-sample.int(N, N*p)
for(i in which_out){
  #### random sample which time point is the outlier, how_many outlier per person
  
  which_session<-sample(c(1:T),how_many)
  y_asym[i,which_session]<-y_asym2[i,which_session]
}
colnames(y_asym) <- c('V1','V2','V3','V4','V5')
age<-matrix(rep(seq(0,T-1,1), N), nrow = N, ncol = 5,byrow = TRUE)
# plot the trajectories
# matplot(t(matrix(rep(0:4, N), nrow = N, byrow = TRUE)), t(y_asym), type = 'l',lty = 2, pch = '.', col = 1:6, xlab = 'T', main = 'Trajectories')


###############################
#### step 2, frequentist mean estimate, for verification purpose
##############################

###### GEE #########
# library(nlme)
# library('tidyr')
# library('gee')
# y<-y_asym
# id<-c(1:nrow(y))
# y<-as.data.frame(cbind(y,id))
# colnames(y)<-c('V1','V2','V3','V4','V5','id')
# X<-as.data.frame(cbind(age,id))
# y_long<-gather(y, term, score, V1:V5)
# X_long<-gather(X, term, age, V1:V5)
# Sim.dat<-merge(y_long, X_long, by = c('id','term'))
# GEE<-gee(score~age, id = id, data = Sim.dat, contrasts = 'exchangeable')
######## GEE estimate
####### exchangeable 6.0522911/0.2157778

# Sim_frq<-groupedData(score ~ age|id, data = Sim.dat)
# lmeSim<-lme(fixed = score ~ age, random = ~ 1 + age, data = Sim_frq)
# Sim_mean_frq<-summary(lmeSim)
# intervals(lmeSim, level = 0.95, which = c('all'))

#################################
######### lavaan estimate #######
#################################
library(lavaan)
gcmodel<-'i =~ 1*V1 + 1*V2 + 1*V3  + 1*V4 + 1*V5
s =~ 0*V1 + 1*V2 + 2*V3 + 3*V4 + 4*V5'
fit<-growth(gcmodel, y_asym)
res<-matrix(c(int, a), nrow = 2)
res<-cbind(res, parameterEstimates(fit)[c(24,25),c(4,5)])



#################
######## Bayesian median
##############
Sys.setenv(USE_CXX14 = 1)
tau<-0.5
library(ggplot2)
library("rstan")


quantile<-"
data{
int<lower=0> N;
int<lower=0> T;
vector[N*T] X;
vector[N*T] y;
real<lower = 0, upper = 1> tau;

//fixed inv_gamma parameter
real shape;
real inv_scale;

//beta prior information
vector[2] beta_0;
cov_matrix[2] Sigma_beta0;

//hyper parameter's value for Sigma_b
cov_matrix[2] Sigma_b0;
}

transformed data{
real theta_tau;
real omegasq_tau;
int len;
theta_tau = (1-2*tau)/(tau*(1-tau));
omegasq_tau = 2/(tau*(1-tau));
len = N*T;
}

parameters{
real<lower=0> sigma;
vector<lower=0>[len] v;
vector[2] beta;
matrix[N,2] b;
cov_matrix[2] Sigma_b;
cov_matrix[2] Sigma_beta;
}


transformed parameters{
vector[len] mu;
matrix[len,2] b_span;
vector[len] sig_y;

for(i in 1:len){
b_span[i,] = b[(i+T-1)/T,];
}
mu = (beta[1] + b_span[,1]) + (beta[2] + b_span[,2]) .* X + theta_tau*v;
sig_y = sqrt(omegasq_tau/sigma*v);
}

model{
// model
y ~ normal(mu, sig_y);

// data augmentation
v ~ exponential(sigma);

// priors
sigma ~ inv_gamma(shape, inv_scale);
beta ~ multi_normal(beta_0, Sigma_beta);
for(i in 1:N){
b[i,] ~ multi_normal([0,0],Sigma_b);
}
Sigma_beta ~ inv_wishart(3, Sigma_beta0);
Sigma_b ~ inv_wishart(3, Sigma_b0);
}"

y<-y_asym
N<-length(y)/T
X<-age
X<-as.vector(t(X))

y<-as.vector(t(y))
lm_est<-lm(y~X)

beta_0<-c(lm_est$coefficients[1],lm_est$coefficients[2])
Sigma_beta0<-matrix(c(1,0.05,0.05,0.1),ncol = 2)
Sigma_b0<-matrix(c(0.5,0,0,0.1),ncol = 2)
v_initial<-rep(1,N*T)


intial<-list(list(sigma = runif(1,0.5,2),beta = beta_0, v=v_initial,Sigma_beta = Sigma_beta0, Sigma_b = Sigma_b0))


dat<-list(N=N, T=T, y=y, X=X, tau=tau, beta_0=beta_0, shape=0.1, inv_scale=0.1, Sigma_beta0=Sigma_beta0, Sigma_b0=Sigma_b0)
fit_median<-stan(model_code = quantile, model_name = "GCM_Quantile", init = intial, pars = c("beta","Sigma_beta", "Sigma_b"),
                 data = dat, iter = 2500, chains = 1)

Sim_median<-summary(fit_median)$summary

write.table(res, file = name1, append = FALSE,row.names = FALSE)
write.table(Sim_median, file = name2, append = FALSE,row.names = FALSE)





