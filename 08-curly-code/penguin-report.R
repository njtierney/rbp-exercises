# penguin report
# see email from Sam re the 2009 numbers
# TODO check the sex thing before this goes out

# setwd("/Users/nick/Desktop/penguin stuff/final2")

library(ggplot2)
library(ggplot2)

CUTOFF = 4000
lbl = "heavy"
year_start = as.numeric("2007")

d<-read.csv("penguins.csv")

d2 = d[d$body_mass_g != NA,]
d2 = d[!is.na(d$body_mass_g),]

if(class(d2) == "data.frame"){
  message("read ok")
}

if(any(duplicated(d2$species))==TRUE){
  message("there are repeated species")
}

if(any(is.na(d2$sex))){
  d2$sex[is.na(d2$sex)] = "unknown"
}

adelie = d2[d2$species=="Adelie",]
a_mean = mean(adelie$body_mass_g)
a_n = nrow(adelie)
a_prop = mean(adelie$body_mass_g > CUTOFF)

chinstrap = d2[d2$species=="Chinstrap",]
c_mean = mean(chinstrap$body_mass_g)
c_n = nrow(chinstrap)
c_prop = mean(chinstrap$body_mass_g > CUTOFF)

gentoo = d2[d2$species=="Gentoo",]
g_mean = mean(gentoo$body_mass_g)
g_n = nrow(gentoo)
g_prop = mean(gentoo$body_mass_g > 4000)

res = data.frame(species=c("Adelie","Chinstrap","Gentoo"),n=c(a_n,c_n,g_n),mean_mass=c(a_mean,c_mean,g_mean),prop_heavy=c(a_prop,c_prop,g_prop))

# res$median_mass = c(a_med, c_med, g_med)
# res$sd_mass = c(a_sd, c_sd, g_sd)
# ggsave("old-plot.png", p)

sp = unique(d2$species)
tmp = split(d2$body_mass_g, d2$species)
n2 = sapply(tmp, function(i) length(i))
n3 = sapply(tmp, length)

out = c()
for(i in 1:length(tmp)){
  out[i] = mean(tmp[[i]] > CUTOFF)
}
names(out) = names(tmp)

d2$heavy = ifelse(d2$body_mass_g > CUTOFF, T, F)
d2$size = ifelse(d2$body_mass_g>5000,"big",ifelse(d2$body_mass_g>4000,"mid","small"))
d2$is_big = ifelse(d2$size == "big", TRUE, FALSE)

res$label = paste0(res$species, " (n=", res$n, ")")
res = res[order(-res$prop_heavy),]

mass_vec = d2$body_mass_g
sorted_mass = mass_vec[order(mass_vec)]
idx = which(grepl("Adelie", d2$species))
cut2 = .5
title_bits = paste0(res$species, collapse = "")

if(nrow(res) > 0 & nchar(lbl) > 0){
  message("we have something to report")
}

if(any(!res$prop_heavy > cut2)){
  message("not every species is mostly heavy")
}

mat = as.matrix(res[,c("n","mean_mass")])
rs = apply(mat, 1, sum)

nrow(d2) -> total_rows

if(total_rows < 10){
  stop(paste0("only ", total_rows, " rows, that cannot be right"))
}

p=ggplot(d2,aes(x=flipper_length_mm,y=body_mass_g,colour=species))+geom_point()+geom_smooth(method="lm",se=F)+labs(title="mass vs flipper",x="flipper",y="mass")
print(p)

print(res)
write.csv(res,"report.csv")
