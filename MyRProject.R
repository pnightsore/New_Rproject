#1. Set workingdirectory:
setwd("/Users/nic/Desktop/DSE/CODING_FOR_DATA_SCIENCE/R_project/data_text")

#2. Import the data.(in this case three dataset,DGP/GINI/refugee): 
GDP<-read.table('GDP.txt',header=TRUE)
refugee<-read.table('refugee.txt',header=TRUE)
GINI<-read.table('GINI.txt',header=TRUE)

#3. Calculate the mean for GDP,refugee,GINI per country across the years:
GDP_ARG<-as.numeric(GDP[1,4:32])
mean(as.numeric(GDP_ARG))
boxplot(GDP_ARG)

#4. Use a loop to get the mean of all countries for each dataset:
for (i in seq(1,17, by=1)){
  m<- as.numeric(GDP[i, 4:32])
  print(mean(m, na.rm=TRUE))
}

for (i in seq(1,17, by=1)){
       n<- as.numeric(refugee[i,  4:32])
       print(mean(n, na.rm=TRUE))
}

for (i in seq(1,17, by=1)){
  n<- as.numeric(GINI[i,  4:31])
  print(mean(n, na.rm=TRUE))
}

#5. Creat a function for the loop:
meancal<-function(x){
  result<-sum(as.numeric(GDP[x,4:32]))/28
  return(result)
}
#EX:
meancal(2)

#6. Plot the bocplot for the GDP of each country:
gdparg<- log(as.numeric(GDP[1,4:32]))
gdparm<-log(as.numeric(GDP[2,4:32]))
gdpbra<-log(as.numeric(GDP[3,4:32]))
gdpchl<-log(as.numeric(GDP[4,4:32]))
gdpcol<-log(as.numeric(GDP[5,4:32]))
gdpcri<-log(as.numeric(GDP[6,4:32]))
gdpdeu<-log(as.numeric(GDP[7,4:32]))
gdpecu<-log(as.numeric(GDP[8,4:32]))
gdphnd<-log(as.numeric(GDP[9,4:32]))
gdpidn<-log(as.numeric(GDP[10,4:32]))
gdpkgz<-log(as.numeric(GDP[11,4:32]))
gdpmex<-log(as.numeric(GDP[12,4:32]))
gdpper<-log(as.numeric(GDP[13,4:32]))
gdprus<-log(as.numeric(GDP[14,4:32]))
gdpslv<-log(as.numeric(GDP[15,4:32]))
gdptha<-log(as.numeric(GDP[16,4:32]))
gdpukr<-log(as.numeric(GDP[17,4:32]))
boxplot(gdparg,gdparm,gdpbra,gdpchl,gdpcol,gdpcri,gdpdeu,gdpecu,gdphnd,gdpidn,gdpkgz,gdpmex,gdpper,gdprus,gdpslv,gdptha,gdpukr,main='boxplot distribution of gdp across countries',ylab='GDP',xlab='Countries')

#6. On the  x axis instead of the numbers, write down the country code:
a<-GDP$Country_Code

#7. Give label GDP to the y axis.

#8. Use log for GDP values.

#9. Save the graph in a pdf format.(function is called pdf):
pdf(file="/Users/nic/Desktop/DSE/Coding/R_project/data_text/gdp.pdf",width=12,height=8)
boxplot(gdparg,gdparm,gdpbra,gdpchl,gdpcol,gdpcri,gdpdeu,gdpecu,gdphnd,gdpidn,gdpkgz,gdpmex,gdpper,gdprus,gdpslv,gdptha,gdpukr,main='boxplot distribution of gdp across countries',ylab='GDP',xlab='Countries',names=c( 'ARG','ARM','BRA','CHL','COL','CRI','DEU','ECU','HND','IDN','KGZ','MEX','PER','RUS','SLV','THA','UKR'))
dev.off()
as.vector(GDP$Country_Code)

#10. Change the function so that GDP can be a variable:
meancal<-function(x,y){
  result<-sum(as.numeric(y[x,4:31]),na.rm=TRUE)/27
  print(result)
}
meancal(1,GDP)
meancal(2,GDP)
meancal(3,refugee)
meancal(2,GINI)

#11. Use the function in a loop.(use the function in the already existing loop):
meancal<-function(x,y){
  result<-sum(as.numeric(y[x,4:31]))/27
  print(result)
}

for (i in seq(1,17, by=1)){
  print(meancal(i,GDP))
}

#12. Creat a function for summary statistics:
summary_stat<-function(x,y,z) {
  
  mean_d<- mean(as.numeric(y[x,z:length(y)]), na.rm=TRUE)
  sd_d<- sd(y[x,z:length(y)], na.rm=TRUE)
  max_d<- max(y[x,z:length(y)], na.rm=TRUE)
  min_d<- min(y[x,z:length(y)], na.rm=TRUE)
  med_d<- median(as.numeric(y[x,z:length(y)]), na.rm=TRUE )
  return(c(mean_d, sd_d, med_d, max_d, min_d))
}
#EX:
summary_stat(1,GDP,4)
summary_stat(5,refugee,4)
summary_stat(5,GINI,4)

#13. Return the output in form of  a table, with header: stat/GDP and save it to a file.(excel) instead of vector:
summary_stat<-function(x,y,z,s) {
  
  mean_d<-mean(as.numeric(y[x,z:length(y)]), na.rm=TRUE)
  sd_d<-sd(y[x,z:length(y)], na.rm=TRUE)
  max_d<- max(y[x,z:length(y)], na.rm=TRUE)
  min_d<-min(y[x,z:length(y)], na.rm=TRUE)
  med_d<- median(as.numeric(y[x,z:length(y)]), na.rm=TRUE )
  sumstat<- c('mean_d','sd_d','max_d','min_d','med_d')
  l<- c(mean_d,sd_d,max_d,min_d,med_d)
  df<- data.frame(sumstat,l)
  colnames(df)<-c('sumstat',s)
  table<- write.table(df, file='summary_stat.csv',sep=",", row.names = F)
  return(table)
}
#EX:
summary_stat(1,GDP,4,s='GDP')

#14. Creat a trend graph,density graph,histogram and a boxplot for one country:
plot(as.numeric(GDP[1,4:32]), type='l')
plot(density(as.numeric(GDP[1,4:32])))
hist(as.numeric(GDP[1,4:32]), breaks= 2)
boxplot(as.numeric(GDP[1,4:32]))

#15. Creat a function that gives unique pdf with 4 plots for each country and each dataset:
explore_plot<- function(x,y,z){
  ?par(mfrow=c(1,4))
  plot1<- plot(as.numeric(y[x,z:length(y)]), type='l')
  plot2<- plot(density(as.numeric(y[x,z:length(y)])))
  plot3<- hist(as.numeric(y[x,z:length(y)]), breaks= 2)
  plot4<- boxplot(as.numeric(y[x,z:length(y)]))
  return(plot1)
  return(plot2)
  return(plot3)
  return(plot4)
}
#EX:
explore_plot(1,GDP,4)

#DRAFT:
pdfplot<- pdf(file='4plot.pdf',width=12,height=8)
dev.off()



