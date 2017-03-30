#### data management
#### katie leap and stephen lauer

## writing a csv
install.packages("Hmisc") # if needed
library(Hmisc)
demographics <- sasxport.get("http://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/DEMO_H.XPT")
View(demographics)
write.csv(demographics, "nhanes-demographics.csv")

### Importing Data
## read.csv() will read in most csv data files
demographics <- read.csv("nhanes-demographics.csv")
View(demographics)

## for larger files (100,000+ rows), as in past DataFests, you may need to use data.tables
install.packages("data.table")
library(data.table)
demographics <- fread("path/to/file/file-name.csv")
demographics <- fread("C:path\to\file\file-name.csv")

## Decide which variables to use
## Look for missing data: why are they missing and is this a problem?
## Look for out-of-range data: why would a living person have a pulse of 0 bpm?
## Make sure numbers are numbers and factors are factors
## BECAUSE YOUR DATA WILL BE UGLY! DEAL WITH IT!
# https://wwwn.cdc.gov/Nchs/Nhanes/2013-2014/DEMO_H.htm


## Introducing dplyr magic!
install.packages(c("plyr", "dplyr"))
library(plyr)
library(dplyr)
demo <- as.tbl(demographics)

## you can "select" columns you like
select(demo, 1:5)
select(demo, seqn, sddsrvyr)
select(demo, -seqn)
select(demo, starts_with("s"))

## you can "filter" rows that you want, using logical operators (>, <, >=, <=, ==, !=)
filter(demo, riagendr==1)
those_young_people <- filter(demo, ridageyr<20)
filter(demo, ridageyr>80)
filter(demo, ridageyr>=80, riagendr==1)
filter(demo, ridageyr>=80 & riagendr==1)
filter(demo, ridageyr>=80 & riagendr==1| ridageyr<80 & riagendr!=1)


## sometimes you want to string together multiple functions, use the pipe %>%!
demo %>% select(1:5) %>% filter(riagendr==1)
## notice that you don't need the first argument to select() or filter()

## these functions happen in order, so if riagendr is not in your select...
demo %>% select(1:3) %>% filter(riagendr==1)
## Error: object 'riagendr' not found

demo %>% filter(riagendr==1) %>% select(1:3) ## this works!

## for organizational purposes it is easier to read it like this:
demo %>%
  filter(riagendr==1) %>%
  select(1:3)

## for clarity, we're going to rename our variables of interest
## select allows you to rename your variables
## mutate creates new variables
dat_mgmt <- demo %>% 
  select(id=seqn, gender=riagendr, age=ridageyr, years_in_us=dmdyrsus) %>% 
  mutate(gender=revalue(as.factor(gender), c("1"="male","2"="female")))
## here we used mutate to replace the 1s and 2s to "male" and "female

## and mathematical functions as well
dat_mgmt %>%
  filter(!years_in_us%in%c(99,77)) %>% 
  mutate(months_in_us=years_in_us*12) %>%
  arrange(desc(months_in_us))
