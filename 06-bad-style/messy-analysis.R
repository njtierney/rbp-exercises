library(dplyr);library(ggplot2)
#read in data
penguins<-read.csv( "penguins.csv" )
Penguins_clean = penguins|>filter(!is.na(bill_length_mm),!is.na(body_mass_g))|>mutate(mass_kg=body_mass_g/1000,bill_ratio=bill_length_mm/bill_depth_mm)
   sd_mass<-sd(Penguins_clean$mass_kg)
mass_mean = mean( Penguins_clean$mass_kg )
Long_variable_Name<-nrow(Penguins_clean);cat("rows:",Long_variable_Name,"\n")

summary_by_species<-Penguins_clean|>group_by(species,island)|>summarise(mass_mean=mean(mass_kg),SD_mass=sd(mass_kg),bill_ratio_mean=mean(bill_ratio),n=n(),.groups="drop")|>arrange(desc(mass_mean))
print(summary_by_species)

m<-lm(mass_kg~flipper_length_mm+species,data=Penguins_clean);print(summary(m))

  p <- ggplot(Penguins_clean,aes(x=flipper_length_mm,y=mass_kg,colour=species))+geom_point(alpha=.6)+geom_smooth(method="lm",se=FALSE)+labs(x="Flipper length (mm)",y="Body mass (kg)",title="penguins")+theme_minimal()
ggsave("fig-mass-flipper.png",p,width=6,height=4)

for(i in 1:length(unique(Penguins_clean$species))){
sp<-unique(Penguins_clean$species)[i]
      sub_dat<-Penguins_clean[Penguins_clean$species==sp,]
  cat(sp,mean(sub_dat$mass_kg),"\n")}
