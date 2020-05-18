
library(cranlogs)
library(dplyr)
library(tibble)

initD <- "2016-04-20"
finalD <- as.character(Sys.Date())
pckgs <- c("UBL")

dt <- as_tibble(cran_downloads(from=initD,to=finalD, packages = pckgs))


filter(dt,package=="UBL") %>% summarize(tot=sum(count))
filter(dt,package=="UBL", date>'2020-04-17') %>% summarize(tot=mean(count)) %>% round()

library(ggplot2)
filter(dt,package=="UBL",date>"2016-04-25") %>%
  ggplot(aes(x=date,y=count)) + geom_line(col='darkblue')

library(ggplot2)

new.dt <- filter(dt,package=="UBL",date>"2016-04-25") %>%
  mutate(cumsum_covered = cumsum(count))

ggplot(new.dt, aes(x=date, y=cumsum_covered)) + geom_line(color="blue") +
  ylab("Downloads' Cummulative Counts")

