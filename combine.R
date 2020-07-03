basic_mean<-matrix(NA, nrow = 0, ncol = 6)
basic_median<-matrix(NA, nrow = 0, ncol = 12)
leverage_mean<-matrix(NA, nrow = 0, ncol = 6)
leverage_median<-matrix(NA, nrow = 0, ncol = 12)
for(i in 1:500){
  name1<-paste('basic_mean_',i,'.txt', sep = '')
  current<-read.table(name1, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  basic_mean<-rbind(basic_mean, wide[1,])

  name2<-paste('basic_median_',i,'.txt', sep = '')
  current<-read.table(name2, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  basic_median<-rbind(basic_median, pick[1,])

  name3<-paste('leverage_mean_',i,'.txt', sep = '')
  current<-read.table(name3, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  leverage_mean<-rbind(leverage_mean, wide[1,])

  name4<-paste('leverage_median_',i,'.txt', sep = '')
  current<-read.table(name4, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  leverage_median<-rbind(leverage_median, pick[1,])
}
write.table(basic_mean, file = "basic_mean_p5.txt", append = FALSE,row.names = FALSE)
write.table(basic_median, file = "basic_median_p5.txt", append = FALSE,row.names = FALSE)
write.table(leverage_mean, file = "leverage_mean_p5.txt", append = FALSE,row.names = FALSE)
write.table(leverage_median, file = "leverage_median_p5.txt", append = FALSE,row.names = FALSE)

basic_mean<-matrix(NA, nrow = 0, ncol = 6)
basic_median<-matrix(NA, nrow = 0, ncol = 12)
leverage_mean<-matrix(NA, nrow = 0, ncol = 6)
leverage_median<-matrix(NA, nrow = 0, ncol = 12)
for(i in 501:1000){
  name1<-paste('basic_mean_',i,'.txt', sep = '')
  current<-read.table(name1, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  basic_mean<-rbind(basic_mean, wide[1,])

  name2<-paste('basic_median_',i,'.txt', sep = '')
  current<-read.table(name2, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  basic_median<-rbind(basic_median, pick[1,])

  name3<-paste('leverage_mean_',i,'.txt', sep = '')
  current<-read.table(name3, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  leverage_mean<-rbind(leverage_mean, wide[1,])

  name4<-paste('leverage_median_',i,'.txt', sep = '')
  current<-read.table(name4, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  leverage_median<-rbind(leverage_median, pick[1,])
}
write.table(basic_mean, file = "basic_mean_p15.txt", append = FALSE,row.names = FALSE)
write.table(basic_median, file = "basic_median_p15.txt", append = FALSE,row.names = FALSE)
write.table(leverage_mean, file = "leverage_mean_p15.txt", append = FALSE,row.names = FALSE)
write.table(leverage_median, file = "leverage_median_p15.txt", append = FALSE,row.names = FALSE)

basic_mean<-matrix(NA, nrow = 0, ncol = 6)
basic_median<-matrix(NA, nrow = 0, ncol = 12)
leverage_mean<-matrix(NA, nrow = 0, ncol = 6)
leverage_median<-matrix(NA, nrow = 0, ncol = 12)
for(i in 1001:1500){
  name1<-paste('basic_mean_',i,'.txt', sep = '')
  current<-read.table(name1, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  basic_mean<-rbind(basic_mean, wide[1,])

  name2<-paste('basic_median_',i,'.txt', sep = '')
  current<-read.table(name2, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  basic_median<-rbind(basic_median, pick[1,])

  name3<-paste('leverage_mean_',i,'.txt', sep = '')
  current<-read.table(name3, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  leverage_mean<-rbind(leverage_mean, wide[1,])

  name4<-paste('leverage_median_',i,'.txt', sep = '')
  current<-read.table(name4, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  leverage_median<-rbind(leverage_median, pick[1,])
}
write.table(basic_mean, file = "basic_mean_p25.txt", append = FALSE,row.names = FALSE)
write.table(basic_median, file = "basic_median_p25.txt", append = FALSE,row.names = FALSE)
write.table(leverage_mean, file = "leverage_mean_p25.txt", append = FALSE,row.names = FALSE)
write.table(leverage_median, file = "leverage_median_p25.txt", append = FALSE,row.names = FALSE)

basic_mean<-matrix(NA, nrow = 0, ncol = 6)
basic_median<-matrix(NA, nrow = 0, ncol = 12)
leverage_mean<-matrix(NA, nrow = 0, ncol = 6)
leverage_median<-matrix(NA, nrow = 0, ncol = 12)
for(i in 1501:2000){
  name1<-paste('basic_mean_',i,'.txt', sep = '')
  current<-read.table(name1, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  basic_mean<-rbind(basic_mean, wide[1,])

  name2<-paste('basic_median_',i,'.txt', sep = '')
  current<-read.table(name2, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  basic_median<-rbind(basic_median, pick[1,])

  name3<-paste('leverage_mean_',i,'.txt', sep = '')
  current<-read.table(name3, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  leverage_mean<-rbind(leverage_mean, wide[1,])

  name4<-paste('leverage_median_',i,'.txt', sep = '')
  current<-read.table(name4, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  leverage_median<-rbind(leverage_median, pick[1,])
}
write.table(basic_mean, file = "basic_mean_p30.txt", append = FALSE,row.names = FALSE)
write.table(basic_median, file = "basic_median_p30.txt", append = FALSE,row.names = FALSE)
write.table(leverage_mean, file = "leverage_mean_p30.txt", append = FALSE,row.names = FALSE)
write.table(leverage_median, file = "leverage_median_p30.txt", append = FALSE,row.names = FALSE)

basic_mean<-matrix(NA, nrow = 0, ncol = 6)
basic_median<-matrix(NA, nrow = 0, ncol = 12)
leverage_mean<-matrix(NA, nrow = 0, ncol = 6)
leverage_median<-matrix(NA, nrow = 0, ncol = 12)
for(i in 2001:2500){
  print(i)
  name1<-paste('basic_mean_',i,'.txt', sep = '')
  current<-read.table(name1, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  basic_mean<-rbind(basic_mean, wide[1,])

  name2<-paste('basic_median_',i,'.txt', sep = '')
  current<-read.table(name2, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  basic_median<-rbind(basic_median, pick[1,])

  name3<-paste('leverage_mean_',i,'.txt', sep = '')
  current<-read.table(name3, header = TRUE)
  wide<-cbind(current[1,], current[2,])
  leverage_mean<-rbind(leverage_mean, wide[1,])

  name4<-paste('leverage_median_',i,'.txt', sep = '')
  current<-read.table(name4, header = TRUE)
  pick<-cbind(6.2, current[1,c(1:4, 8)], 1.5, current[2, c(1:4, 8)])
  leverage_median<-rbind(leverage_median, pick[1,])
}


write.table(basic_mean, file = "basic_mean_p35.txt", append = FALSE,row.names = FALSE)
write.table(basic_median, file = "basic_median_p35.txt", append = FALSE,row.names = FALSE)
write.table(leverage_mean, file = "leverage_mean_p35.txt", append = FALSE,row.names = FALSE)
write.table(leverage_median, file = "leverage_median_p35.txt", append = FALSE,row.names = FALSE)