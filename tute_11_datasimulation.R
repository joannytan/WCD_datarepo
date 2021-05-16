library(tidyverse)
library(lubridate)
library(randomNames)


tute11_dat  <- expand.grid(sex = c('M','F'),
                           age = 18:78)

tute11_dat <- tute11_dat[sample(nrow(tute11_dat),40),]

tute11_dat$date_time <-sample(seq(ymd_hms("2019-2-11 9:00:00", tz ="Australia/Melbourne"), ymd_hms("2019-2-11 21:00:00", tz ="Australia/Melbourne"), by="min"), 40)

tute11_dat$date <- date(tute11_dat$date_time)

tute11_dat$time <- ifelse(hour(tute11_dat$date_time)<12, "morning",
                          ifelse(hour(tute11_dat$date_time)<17,"afternoon",
                                 "evening"))
tute11_dat$blood_sugar <- sample(c("high","normal"),40, replace = TRUE)


tute11_dat$firstname = randomNames(40, which.names = "first")

tute11_dat$lastname = randomNames(40, which.names = "last")



survey_data <- tute11_dat %>%
  select(time,blood_sugar,sex,age,date)

blood_donation <- tute11_dat %>%
  select(date_time,sex,age,firstname,lastname)

write.csv(blood_donation,"data/blood_donation.csv", row.names=FALSE)
write.csv(survey_data,"data/survey_data.csv", row.names=FALSE)
