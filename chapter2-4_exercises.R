setwd("~/Downloads")
college = read.csv("college.csv")
#fix(college)
rownames(college)=college[,1]
#fix(college)
#eliminate the first column in the data where the names are stored
college=college[,-1]
#fix(college)
summary(college)
pairs(college[,1:10])
#use the plot function to produce side-by-side boxplots
#attach(college)
#you really struggled with this next line
plot(Outstate ~ Private)
#boxplot(Outstate ~ Private, college, na.omit)
elite=rep("No", nrow(college))
elite[college$Top10perc>50]="Yes"
elite=as.factor(elite)
college=data.frame(college,elite)
summary(elite)
#struggled but you did it
plot(college$Outstate ~ elite)
par(mfrow=c(2,2))
hist(F.Undergrad,col=3,breaks=10)
hist(Room.Board, col=6,breaks = 10)
hist(Books,col = 4,breaks = 10)
hist(Personal, col=5, breaks=10)
Auto = read.csv("Auto.csv", header = T, na.strings = "?")
#remove obs with missing values
Auto = na.omit(Auto)
dim(Auto)
names(Auto)
#important functions below. return names if
library(dplyr)
names(dplyr::select_if(Auto,is.numeric))
names(dplyr::select_if(Auto,is.factor))
range(dplyr::select_if(Auto,is.numeric))
#importanta function
autoquants = Auto[sapply(Auto, is.numeric)]
colMeans(autoquants)
sapply(autoquants, sd)
#excluding records in r/ VERY IMPORTANT
sapply(autoquants[-c(10:85),],mean)
sapply(autoquants[-c(10:85),],range)
sapply(autoquants[-c(10:85),],sd)
#scatterplot predictors
pairs(Auto)
#answers
# Part (e):
#
#postscript("../../WriteUp/Graphics/Chapter2/prob_9_pairs_plot.eps", onefile=FALSE, horizontal=FALSE)
##pairs( Auto[,-qualitative_columns] )
#dev.off()

#postscript("../../WriteUp/Graphics/Chapter2/prob_9_mpg_vs_year.eps", onefile=FALSE, horizontal=FALSE)
##plot( Auto$year, Auto$mpg )
#dev.off()

# Lets plot some mpg vs. some of our qualitative features:
#
#postscript("../../WriteUp/Graphics/Chapter2/prob_9_mpg_vs_cylinders.eps", onefile=FALSE, horizontal=FALSE)
##plot( as.factor(Auto$cylinders), Auto$mpg )
#dev.off()

#postscript("../../WriteUp/Graphics/Chapter2/prob_9_mpg_vs_origin.eps", onefile=FALSE, horizontal=FALSE)
##plot( as.factor(Auto$origin), Auto$mpg )
#dev.off()

