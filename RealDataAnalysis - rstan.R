Sys.setenv(USE_CXX14 = 1)
library(ggplot2)
library('rstan')
Mem<-read.csv('VCAP.csv')

y<-Mem

GCM<-'
data{
int<lower=0> N;
int<lower=0> T;
matrix[N,T] time;
matrix[N,T] y;
real shape1;
real shape2;
real shape3;
real inv_scale1;
real inv_scale2;
real inv_scale3;
}

parameters{
real slope_avg;
real intercept_avg;
real<lower = 0> sig_y;
real<lower = 0> sig_slope;
real<lower = 0> sig_intercept;
vector[N] slope;
vector[N] intercept; 
}

model{
for(i in 1:N){
y[i,] ~ normal(intercept[i] + time[i,] * slope[i], sig_y);
}

slope ~ normal(slope_avg, sig_slope);
intercept ~ normal(intercept_avg, sig_intercept);
sig_y ~ inv_gamma(shape1, inv_scale1);
sig_slope ~ inv_gamma(shape2, inv_scale2);
sig_intercept ~ inv_gamma(shape3, inv_scale3);
}'

##initial values
N<-nrow(y)
T<-5
X<-as.vector(time)

y_ini<-as.vector(t(y))
lm_est<-lm(y_ini~X)
intercept_avg<-lm_est$coefficients[1]
slope_avg<-lm_est$coefficients[2]

intial<-list(list(slope = rep(slope_avg, N), intercept = rep(intercept_avg, N)))
dat<-list(N=N, T=5, y, time, shape1=0.1, inv_scale1=0.1, shape2=0.1, inv_scale2=0.1, shape3=0.1, inv_scale3=0.1)
fit<-stan(model_code = GCM, model_name = "GCM", init = intial, pars = c("slope_avg","intercept_avg", "sig_slope", 'sig_intercept'),
          data = dat, iter = 2500, chains = 1)
fit_GCM<-summary(fit)
fit_GCM$summary



