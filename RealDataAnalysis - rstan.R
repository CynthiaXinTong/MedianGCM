library('readxl')
rawdata<-read_xlsx('VCAP.xlsx')
library("rstan")
rstan_options(auto_write = TRUE)
## analyze subjects with 5 follow up episodes
complete_data<-rawdata[rawdata$NumOcc==5,]

## Voc, Mem and Spd are the measurement of interest
Voc<-cbind(complete_data$T1Voc1C,complete_data$T2Voc1C,complete_data$T3Voc1C,complete_data$T4Voc1C,complete_data$T5Voc1C)
time<-cbind(rep(0,338),complete_data$'T1-T2Int',complete_data$'T1-T3Int',complete_data$'T1-T4Int',complete_data$'T1-T5Int')

## the 125 row contains NA value, and this row is removed
Voc<-Voc[-125,]
time<-time[-125,]

tau<-0.5
y<-Voc
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
// transformed data to improve code readability
// data augmentation parameter
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

// running matrix computation is rather slow in stan. Flatten two dimensional matrix computation into vector
// so the code runs faster

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

## prepare intitial values&fixed values
N<-length(y)/5
X<-time
X<-as.vector(X)

## use linear regression as intial value for MCMC 
y<-as.vector(t(y))
lm_est<-lm(y~X)

beta_0<-c(lm_est$coefficients[1],lm_est$coefficients[2])
Sigma_beta0<-matrix(c(1,0.05,0.05,0.1),ncol = 2)
Sigma_b0<-matrix(c(1,0,0,0.1),ncol = 2)
v_initial<-rep(1,N*5)


intial<-list(list(sigma=runif(1,0.5,2),beta=beta_0, v=v_initial,Sigma_beta=Sigma_beta0, Sigma_b=Sigma_b0))


dat<-list(N=N, T=5, y=y, X=X, tau=tau, beta_0=beta_0, shape=0.1, inv_scale=0.1, Sigma_beta0=Sigma_beta0, Sigma_b0=Sigma_b0)
fit<-stan(model_code = quantile, model_name = "GCM_Quantile", init = intial, pars = c('beta', 'Sigma_b'),
          data = dat, iter = 15000, chains = 1)

library(bayesplot)
color_scheme_set('mix-blue-red')
colnames(fit)
dim(fit)
mcmc_trace(fit, pars = c("beta[1]","beta[2]", "Sigma_b[1,1]", "Sigma_b[1,2]", "Sigma_b[2,2]"),
           facet_args = list(ncol = 1, strip.position = "left"), iter1 = 7500)

library(coda)
content<-extract(fit)
geweke.diag(content$beta[,1])$z
geweke.diag(content$beta[,2])$z
geweke.diag(content$Var_b[, 1, 1])$z
geweke.diag(content$Var_b[, 1, 2])$z
geweke.diag(content$Var_b[, 2, 2])$z

