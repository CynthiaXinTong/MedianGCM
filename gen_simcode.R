for(i in 1:500){
  new_script<-paste('basic_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.05,"/g' basic_template.R > ", new_script, sep = '')
  system(bashcode)
  new_script<-paste('leverage_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.05,"/g' leverage_template.R > ", new_script, sep = '')
  system(bashcode)
}

for(i in 500:1000){
  new_script<-paste('basic_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.15,"/g' basic_template.R > ", new_script, sep = '')
  system(bashcode)
  new_script<-paste('leverage_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.15,"/g' leverage_template.R > ", new_script, sep = '')
  system(bashcode)
}

for(i in 1001:1500){
  new_script<-paste('basic_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.25,"/g' basic_template.R > ", new_script, sep = '')
  system(bashcode)
  new_script<-paste('leverage_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.25,"/g' leverage_template.R > ", new_script, sep = '')
  system(bashcode)
}

for(i in 1501:2000){
  new_script<-paste('basic_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.3,"/g' basic_template.R > ", new_script, sep = '')
  system(bashcode)
  new_script<-paste('leverage_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.3,"/g' leverage_template.R > ", new_script, sep = '')
  system(bashcode)
}

for(i in 2001:2500){
  new_script<-paste('basic_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.35,"/g' basic_template.R > ", new_script, sep = '')
  system(bashcode)
  new_script<-paste('leverage_', i,'.R', sep = '')
  bashcode<-paste("sed 's/index/", i, "/g;s/percentage/",0.35,"/g' leverage_template.R > ", new_script, sep = '')
  system(bashcode)
}

