# air quality analysis
# started this ages ago, came back to it
# NOTE: this is the one that works. ignore analysis_old.R

library(ggplot2)

cutoff <- 30

d=airquality
d2 = d[!is.na(d$Ozone),]
d2$month_name=month.name[d2$Month]

# drop the really windy days, they were doing something strange
d2 = d2[d2$Wind<20,]

may = d2[d2$Month==5,]
june = d2[d2$Month==6,]
july = d2[d2$Month==7,]

may_mean = mean(may$Ozone)
june_mean=mean(june$Ozone)
july_mean = mean(july$Ozone)

# may_median = median(may$Ozone)
# june_median = median(june$Ozone)
# july_median = median(july$Ozone)

res=data.frame(month=c("May","June","July"),mean_ozone=c(may_mean,june_mean,july_mean))

print(res)

tmp <- split(d2$Ozone, d2$Month)
n <- sapply(tmp, function(i) length(i))

x1 = c()
for(i in 1:length(tmp)){
x1[i] = mean(tmp[[i]] > cutoff)
}

names(x1) = names(tmp)

d3 = data.frame(month=names(n), n=as.numeric(n), prop_high=as.numeric(x1))

# add the labels and sort it and work out which ones we care about
d3$label = paste0(d3$month, " (n=", d3$n, ")")
d3 = d3[order(-d3$prop_high),]
d3$flag = d3$prop_high > 0.5
worst = d3$month[1]

p=ggplot(d2,aes(x=Temp,y=Ozone))+geom_point()+geom_smooth(method="lm",se=F)+labs(title="ozone vs temp",x="temperature",y="ozone")
print(p)

p2 <- ggplot(d3, aes(x = label, y = prop_high)) +
  geom_col() +
  labs(title = paste("proportion of days above", cutoff), x = "", y = "")
print(p2)

# check whether the flagged months are the hot ones
hot = d2[d2$Temp > mean(d2$Temp),]
hot_months = unique(hot$Month)
if(worst %in% hot_months == T){
  message("worst month is a hot month")
} else {
  message("worst month is not a hot month")
}

write.csv(res,"results.csv")
write.csv(d3,"results2.csv")
