basic_median<-matrix(NA, nrow = 5, ncol = 6)
colnames(basic_median)<-c('percentage','est','bias','mse','ASE','ESE')

basic_median_p5<-read.table('basic_median_p5.txt', header = TRUE)
basic_median_p15<-read.table('basic_median_p15.txt', header = TRUE)
basic_median_p25<-read.table('basic_median_p25.txt', header = TRUE)
basic_median_p30<-read.table('basic_median_p30.txt', header = TRUE)
basic_median_p35<-read.table('basic_median_p35.txt', header = TRUE)

basic_median[,1]<-c(5, 15, 25, 30, 35)
basic_median[1,2]<-mean(basic_median_p5[,8]);basic_median[1,3]<-basic_median[1,2]-1.5;basic_median[1,4]<-var(basic_median_p5[,5])+basic_median[1,3]^2
basic_median[2,2]<-mean(basic_median_p15[,8]);basic_median[2,3]<-basic_median[2,2]-1.5;basic_median[2,4]<-var(basic_median_p15[,5])+basic_median[2,3]^2
basic_median[3,2]<-mean(basic_median_p25[,8]);basic_median[3,3]<-basic_median[3,2]-1.5;basic_median[3,4]<-var(basic_median_p25[,5])+basic_median[3,3]^2
basic_median[4,2]<-mean(basic_median_p25[,8]);basic_median[4,3]<-basic_median[4,2]-1.5;basic_median[4,4]<-var(basic_median_p25[,5])+basic_median[4,3]^2
basic_median[5,2]<-mean(basic_median_p25[,8]);basic_median[5,3]<-basic_median[5,2]-1.5;basic_median[5,4]<-var(basic_median_p25[,5])+basic_median[5,3]^2

basic_median[1,5]<-mean(basic_median_p5[,10])
basic_median[2,5]<-mean(basic_median_p15[,10])
basic_median[3,5]<-mean(basic_median_p25[,10])
basic_median[4,5]<-mean(basic_median_p30[,10])
basic_median[5,5]<-mean(basic_median_p35[,10])

basic_median[1,6]<-sd(basic_median_p5[,8])
basic_median[2,6]<-sd(basic_median_p15[,8])
basic_median[3,6]<-sd(basic_median_p25[,8])
basic_median[4,6]<-sd(basic_median_p30[,8])
basic_median[5,6]<-sd(basic_median_p35[,8])


leverage_median<-matrix(NA, nrow = 5, ncol = 6)
colnames(leverage_median)<-c('percentage','est','bias','mse','ASE','ESE')

leverage_median_p5<-read.table('leverage_median_p5.txt', header = TRUE)
leverage_median_p15<-read.table('leverage_median_p15.txt', header = TRUE)
leverage_median_p25<-read.table('leverage_median_p25.txt', header = TRUE)
leverage_median_p30<-read.table('leverage_median_p30.txt', header = TRUE)
leverage_median_p35<-read.table('leverage_median_p35.txt', header = TRUE)

leverage_median[,1]<-c(5, 15, 25, 30, 35)
leverage_median[1,2]<-mean(leverage_median_p5[,8]);leverage_median[1,3]<-leverage_median[1,2]-1.5;leverage_median[1,4]<-var(leverage_median_p5[,5])+leverage_median[1,3]^2
leverage_median[2,2]<-mean(leverage_median_p15[,8]);leverage_median[2,3]<-leverage_median[2,2]-1.5;leverage_median[2,4]<-var(leverage_median_p15[,5])+leverage_median[2,3]^2
leverage_median[3,2]<-mean(leverage_median_p25[,8]);leverage_median[3,3]<-leverage_median[3,2]-1.5;leverage_median[3,4]<-var(leverage_median_p25[,5])+leverage_median[3,3]^2
leverage_median[4,2]<-mean(leverage_median_p25[,8]);leverage_median[4,3]<-leverage_median[4,2]-1.5;leverage_median[4,4]<-var(leverage_median_p25[,5])+leverage_median[4,3]^2
leverage_median[5,2]<-mean(leverage_median_p25[,8]);leverage_median[5,3]<-leverage_median[5,2]-1.5;leverage_median[5,4]<-var(leverage_median_p25[,5])+leverage_median[5,3]^2

leverage_median[1,5]<-mean(leverage_median_p5[,10])
leverage_median[2,5]<-mean(leverage_median_p15[,10])
leverage_median[3,5]<-mean(leverage_median_p25[,10])
leverage_median[4,5]<-mean(leverage_median_p30[,10])
leverage_median[5,5]<-mean(leverage_median_p35[,10])

leverage_median[1,6]<-sd(leverage_median_p5[,8])
leverage_median[2,6]<-sd(leverage_median_p15[,8])
leverage_median[3,6]<-sd(leverage_median_p25[,8])
leverage_median[4,6]<-sd(leverage_median_p30[,8])
leverage_median[5,6]<-sd(leverage_median_p35[,8])

