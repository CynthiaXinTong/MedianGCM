basic_mean<-matrix(NA, nrow = 5, ncol = 6)
colnames(basic_mean)<-c('percentage','est','bias','mse','ASE','ESE')

basic_mean_p5<-read.table('basic_mean_p5.txt', header = TRUE)
basic_mean_p15<-read.table('basic_mean_p15.txt', header = TRUE)
basic_mean_p25<-read.table('basic_mean_p25.txt', header = TRUE)
basic_mean_p30<-read.table('basic_mean_p30.txt', header = TRUE)
basic_mean_p35<-read.table('basic_mean_p35.txt', header = TRUE)

basic_mean[,1]<-c(5, 15, 25, 30, 35)
basic_mean[1,2]<-mean(basic_mean_p5[,5]);basic_mean[1,3]<-basic_mean[1,2]-1.5;basic_mean[1,4]<-var(basic_mean_p5[,5])+basic_mean[1,3]^2
basic_mean[2,2]<-mean(basic_mean_p15[,5]);basic_mean[2,3]<-basic_mean[2,2]-1.5;basic_mean[2,4]<-var(basic_mean_p15[,5])+basic_mean[2,3]^2
basic_mean[3,2]<-mean(basic_mean_p25[,5]);basic_mean[3,3]<-basic_mean[3,2]-1.5;basic_mean[3,4]<-var(basic_mean_p25[,5])+basic_mean[3,3]^2
basic_mean[4,2]<-mean(basic_mean_p25[,5]);basic_mean[4,3]<-basic_mean[4,2]-1.5;basic_mean[4,4]<-var(basic_mean_p25[,5])+basic_mean[4,3]^2
basic_mean[5,2]<-mean(basic_mean_p25[,5]);basic_mean[5,3]<-basic_mean[5,2]-1.5;basic_mean[5,4]<-var(basic_mean_p25[,5])+basic_mean[5,3]^2

basic_mean[1,5]<-mean(basic_mean_p5[,6])
basic_mean[2,5]<-mean(basic_mean_p15[,6])
basic_mean[3,5]<-mean(basic_mean_p25[,6])
basic_mean[4,5]<-mean(basic_mean_p30[,6])
basic_mean[5,5]<-mean(basic_mean_p35[,6])

basic_mean[1,6]<-sd(basic_mean_p5[,5])
basic_mean[2,6]<-sd(basic_mean_p15[,5])
basic_mean[3,6]<-sd(basic_mean_p25[,5])
basic_mean[4,6]<-sd(basic_mean_p30[,5])
basic_mean[5,6]<-sd(basic_mean_p35[,5])


leverage_mean<-matrix(NA, nrow = 5, ncol = 6)
colnames(leverage_mean)<-c('percentage','est','bias','mse','ASE','ESE')

leverage_mean_p5<-read.table('leverage_mean_p5.txt', header = TRUE)
leverage_mean_p15<-read.table('leverage_mean_p15.txt', header = TRUE)
leverage_mean_p25<-read.table('leverage_mean_p25.txt', header = TRUE)
leverage_mean_p30<-read.table('leverage_mean_p30.txt', header = TRUE)
leverage_mean_p35<-read.table('leverage_mean_p35.txt', header = TRUE)

leverage_mean[,1]<-c(5, 15, 25, 30, 35)
leverage_mean[1,2]<-mean(leverage_mean_p5[,5]);leverage_mean[1,3]<-leverage_mean[1,2]-1.5;leverage_mean[1,4]<-var(leverage_mean_p5[,5])+leverage_mean[1,3]^2
leverage_mean[2,2]<-mean(leverage_mean_p15[,5]);leverage_mean[2,3]<-leverage_mean[2,2]-1.5;leverage_mean[2,4]<-var(leverage_mean_p15[,5])+leverage_mean[2,3]^2
leverage_mean[3,2]<-mean(leverage_mean_p25[,5]);leverage_mean[3,3]<-leverage_mean[3,2]-1.5;leverage_mean[3,4]<-var(leverage_mean_p25[,5])+leverage_mean[3,3]^2
leverage_mean[4,2]<-mean(leverage_mean_p25[,5]);leverage_mean[4,3]<-leverage_mean[4,2]-1.5;leverage_mean[4,4]<-var(leverage_mean_p25[,5])+leverage_mean[4,3]^2
leverage_mean[5,2]<-mean(leverage_mean_p25[,5]);leverage_mean[5,3]<-leverage_mean[5,2]-1.5;leverage_mean[5,4]<-var(leverage_mean_p25[,5])+leverage_mean[5,3]^2

leverage_mean[1,5]<-mean(leverage_mean_p5[,6])
leverage_mean[2,5]<-mean(leverage_mean_p15[,6])
leverage_mean[3,5]<-mean(leverage_mean_p25[,6])
leverage_mean[4,5]<-mean(leverage_mean_p30[,6])
leverage_mean[5,5]<-mean(leverage_mean_p35[,6])

leverage_mean[1,6]<-sd(leverage_mean_p5[,5])
leverage_mean[2,6]<-sd(leverage_mean_p15[,5])
leverage_mean[3,6]<-sd(leverage_mean_p25[,5])
leverage_mean[4,6]<-sd(leverage_mean_p30[,5])
leverage_mean[5,6]<-sd(leverage_mean_p35[,5])

