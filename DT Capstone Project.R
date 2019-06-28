#Read hd2017 and ef2017a_dist files
library(readxl)
hd2017 <- read_excel("SpringBoard DS Course/CapstoneProject/hd2017.xlsx")
head(hd2017)
ef2017a_dist <- read_excel("SpringBoard DS Course/CapstoneProject/ef2017a_dist.xlsx")
#Merge the two files by UNITID 
merged2017 <- merge(ef2017a_dist, hd2017, by="UNITID")
#Select all students (undergraduate and graduate) and exclude for profit colleges and universities (CONTROL=3) 
merged_all_levels <- subset(merged2017, EFDELEV == "1" & CONTROL < 3 )
factor_hbcu <- factor(merged_all_levels$HBCU)
#select only HBCUs
hbcu <-subset(merged_all_levels, HBCU == "1" )
attach(hbcu)
str(hbcu) 
#Calculate: a) Percent of students who are enrolled exclusively in online programs and b) percent of students taking some online classes; run descriptive statistics for these two metrics 
perc100online <- EFDEEXC/EFDETOT
perc_some_online <- EFDESOM/EFDETOT
summary(perc100online)
summary(perc_some_online)
hist(perc100online)
hist(perc_some_online)
boxplot(perc100online)
boxplot(perc_some_online)

#Calculate: a) Percent of online students from out of state, b) percent of online students from outside US;  run descriptive statistics for these two metrics 
perc_state<- EFDEEX1/EFDETOT
perc_out <- (EFDEEX2+ EFDEEX3)/EFDETOT
perc_int<- EFDEEX4/EFDETOT
summary(perc_state)
summary(perc_out)
summary(perc_int)

hist(perc_state)
hist(perc_out)
hist(perc_int)

boxplot(perc_state)
boxplot(perc_out)
boxplot(perc_int)


#select non-HBCUs only
non_hbcu <-subset(merged_all_levels, HBCU == "2")
str(non_hbcu)
attach(non_hbcu)
#Calculate: a) Percent of students who are enrolled exclusively in online programs and b) percent of students taking some online classes; run descriptive statistics for these two metrics 
perc100online <- EFDEEXC/EFDETOT
perc_some_online <- EFDESOM/EFDETOT
summary(perc100online)
summary(perc_some_online)
hist(perc100online)
hist(perc_some_online)
boxplot(perc100online)
boxplot(perc_some_online)

#Calculate: a) Percent of online students from out of state, b) percent of online students from outside US;  run descriptive statistics for these two metrics 
perc_state<- EFDEEX1/EFDETOT
perc_out <- (EFDEEX2+ EFDEEX3)/EFDETOT
perc_int<- EFDEEX4/EFDETOT
summary(perc_state)
summary(perc_out)
summary(perc_int)

hist(perc_state)
hist(perc_out)
hist(perc_int)

boxplot(perc_state)
boxplot(perc_out)
boxplot(perc_int)


