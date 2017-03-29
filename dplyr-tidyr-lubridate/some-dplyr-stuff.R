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
demographics <- read.csv("path/to/file/nhanes-demographics.csv")
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

- We're going to look at the following functions in `dplyr`:
- `group_by()`
- `summarize()`
- `arrange()`
- They all do what it sounds like they do (but we'll go through them anyways)

But First!
  ========================================================
  - the pipe!
  - **%>%**
  - this handy little thing comes from the `magrittr` package
- replaces the first argument in a function with the object before the pipe
- it makes code a million times more readable
- keyboard shortcut: **cmd-shift-M** (for **m**agrittr)

%>% in action!
  ========================================================
  ```{r}
library(magrittr) # or dplyr
## confusing ##
mean(seq_len(sum(seq(1:10))))

## clear ##
seq(1:10) %>% 
  sum %>%
  seq_len %>% 
  mean
```

Back to NHANES
========================================================
  - Our first step is to decide which variables we want to use
- We probably want to investigate a relationship, so we should choose a predictor variable and a response variable
- Now we look at the codebook to figure out what these have been named

Back to NHANES
========================================================
  - Let's select the variables we decided to work with
                                           - We can rename them at the same time
                                           ```{r}
                                           library(plyr)
                                           library(dplyr)
                                           demo <- demographics %>% 
                                             select(id=seqn,gender=riagendr,age=ridageyr) 
                                           ```
                                           - If we didn't want to select only a specific number of columns, we would use `rename()`

Freebie: helper functions
========================================================
  - `contains()`
- `ends_with()`
- `everything()`
- `matches()`
- `num_range("x", 1:5)`: columns named x1, x2, x3, x4, x5.
- `one_of()`
- `starts_with()`

Back to Cleaning!
  ========================================================
  - `summary()` provides summary statistics
- this is a one-stop-shop for missing data, out-of-range data and checking that numbers are numbers and factors are factors
- however magic `dplyr` is, data management relies on your brain
- be thorough
- document what you do
- justify every decision you make
- don't overwrite your original data
                                           
                                           ========================================================
                                             ![Plus, now I know that I have risk factors for elbow dysplasia, heartworm, parvo, and mange.](http://imgs.xkcd.com/comics/genetic_testing.png)
                                           
                                           Mutants!
                                             ========================================================
                                             - `mutate()` allows us to add new columns
                                           - usually we do this because we have changed something about another column and want to preserve both
                                           - for example, changing kg to lbs because this is AMERICA
                                           - `mutate_each()`: multiple columns
                                           
                                           Mutants!
                                             ========================================================
                                             ```{r}
                                           demo <- demographics %>% 
                                             select(id=seqn,gender=riagendr,age=ridageyr) %>% 
                                             mutate(gender=revalue(as.factor(gender), c("1"="male","2"="female")))
                                           summary(demo)
                                           ```
                                           
                                           Select : Columns :: Filter : Rows
                                           ========================================================
                                             - `filter()` allows you to pick rows that have a specific value inside a column
                                           - For example, let's say we want to pick all of the women
```{r}
women <- demo %>% 
  filter(gender=="female")
```
- You can use the >, <, ==, >=, and <= operators to `filter()` rows
```{r}
old.farts <- demo %>% 
  filter(age>75)
```

Summarize
========================================================
  - When we want to get one number, we use `summarize()`
- Think of functions like `mean()`
```{r}
demo %>% 
  summarize(mean.age = mean(age))
```
- `summarize_each()`: multiple columns

Grouping
========================================================
  ```{r}
group <- demo %>%
  group_by(gender)
head(group)
```

Arrange
========================================================
  ```{r}
arrange <- demo %>% 
  arrange(gender)
head(arrange)
```

Divide and Conquer!
  ========================================================
  ```{r}
demo %>%
  group_by(gender) %>%  
  summarize(mean.age = mean(age))
```

Freebie: Summarize function examples
========================================================
  - `dplyr` specific:
  - `first`: First value of a vector.
- `last`: Last value of a vector.
- `nth`: Nth value of a vector.
- `n`: # of values in a vector.
  - `n_distinct`: # of distinct values in a vector.
  - Other functions:
  - `IQR`
- `min`, `max`
- `mean`, `median`
- `var`, `sd`

Why did we download two datasets?
========================================================
  - Because we can join them!
  - There are different joins depending on how you want to do it
- I look them up every time: [data wrangling cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

But first!
  ========================================================
  - 10 minutes to clean the second dataset!
  - Remember to:
  - select just the variables you want (rename probably)
- look for missing values
- check your factors

```{r, echo=FALSE}
ts <- taste.smell %>% 
  select(id=seqn,runny=csq260n,choc=csxchood) %>% 
  mutate(runny=replace(runny,is.na(runny),0) %>% 
           as.factor %>% 
           revalue(c("1"="yes","0"="no")),
         choc=revalue(as.factor(choc),c("1"="Lemon", "2"="Chocolate", 
                                        "3"="Smoke","4"="Black pepper")))
```

Left join!
  ========================================================
  ```{r}
library(tidyr)
full.dat <- left_join(demo, ts, by = "id")
```
- Optional `by` statement
- Can use more than one `by` variables as well
- `by = c("id","age")`

Have fun!
  ========================================================
  - Find some interesting stuff, please
- Take a snack break if you like
- Let us know what you find!
  - Do old people smell funny?
- Complete list of `dplyr` functions can be found on the [data wrangling cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

Web Scraping
========================================================
  - Refers to extracting information from websites
- Really easy to do in R with the help of some packages
- `XML`
- `rvest`

Case Study 2: Scraping Celtics statistics
========================================================
  Scraping an HTML table from [www.basketball-reference.com/teams/BOS/2016.html](http://www.basketball-reference.com/teams/BOS/2016.html)
```{r}
library(XML)
site <- "http://www.basketball-reference.com/teams/BOS/2016.html"
celtics_2016 <- readHTMLTable(site)
celtics_players <- celtics_2016$per_game
```

Highest scoring Celtics in 2016
========================================================
  ```{r, echo=F}
celtics_players %>% 
  select(Player, Age, G, PTS) %>% 
  arrange(desc(PTS)) %>% 
  head
```

Looking at historical Celtics stats
========================================================
  ```{r, warnings=FALSE}
years <- 1980:2013
all_celtics <- c()
for(year in years){
  site <- paste0("http://www.basketball-reference.com/teams/BOS/", year, ".html")
  celtics_one_year <- readHTMLTable(site)
  one_year_players <- celtics_one_year$per_game
  one_year_players$Year <- year
  all_celtics <- bind_rows(all_celtics, one_year_players)
}
```

Highest scoring Celtics in a single season
========================================================
  ```{r,eval=FALSE}
all_celtics %>% 
  select(Player, Year, PTS) %>% 
  arrange(desc(as.numeric(PTS)))
```

Highest scoring Celtics in a single season
========================================================
  ```{r,echo=FALSE}
all_celtics %>% 
  select(Player, Year, PTS) %>% 
  arrange(desc(as.numeric(PTS)))
```

Highest scoring Celtics over career
========================================================
  ```{r,eval=FALSE}
all_celtics %>% 
  group_by(Player) %>% 
  summarize(Games=sum(as.numeric(G)),             
            PPG=weighted.mean(as.numeric(PTS), as.numeric(G))) %>% 
  arrange(desc(PPG))
```

Highest scoring Celtics over career
========================================================
  ```{r,echo=FALSE}
all_celtics %>% 
  group_by(Player) %>% 
  summarize(Games=sum(as.numeric(G)),             
            PPG=weighted.mean(as.numeric(PTS), as.numeric(G))) %>% 
  arrange(desc(PPG))
```

`rvest` and the SelectorGadget
========================================================
  - Load up `rvest`
```{r}
library(rvest)
```
- Download the selector gadget at [selectorgadget.com](http://selectorgadget.com/)

IMDB Web Scrape
========================================================
  [IMDB's Top 100 "Robot Movies"](http://www.imdb.com/search/title?count=100&keywords=robot&num_votes=3000,&title_type=feature&ref_=gnr_kw_ro)
```{r}
imdb <- read_html("http://www.imdb.com/search/title?count=100&keywords=robot&num_votes=3000,&title_type=feature&ref_=gnr_kw_ro")

descriptions <- imdb %>% 
  html_nodes(".outline") %>% 
  html_text()
```
IMDB Web Scrape
========================================================
  ```{r}
descriptions[[1]]
```

IMDB Web Scrape
========================================================
  ```{r}
rating <- imdb %>% 
  html_nodes(".value") %>% 
  html_text() %>% 
  as.numeric
```

IMDB Web Scrape
========================================================
  ```{r}
head(rating)
```

IMDB Web Scrape
========================================================
  ```{r}
year <- imdb %>% 
  html_nodes(".year_type") %>% 
  html_text() %>% 
  gsub(pattern="\\(",replacement="") %>% 
  gsub(pattern="\\)",replacement="") %>% 
  as.numeric
```

IMDB Web Scrape
========================================================
  ```{r}
head(year)
```

IMDB Web Scrape
========================================================
  ```{r}
title <- imdb %>% 
  html_nodes(".title") %>% 
  html_text()

title2 <- unlist(strsplit(title,"\n    \n\n\n\n    "))[seq(from=2,to=length(title),by=2)]
title3 <- unlist(strsplit(title2,"\n    \\("))[seq(from=1,to=length(title),by=2)]
```

IMDB Web Scrape
========================================================
  ```{r}
head(title3)
```

IMDB Web Scrape
========================================================
  ```{r}
robot.movies <- data.frame(title=title3,year,rating)
head(arrange(robot.movies,desc(rating)),4)
```

IMDB Web Scrape Activities
========================================================
  - Find which years have had the most "robot movies"
- Use `grep` to find which descriptions contain robot words ("robot", "android", "AI", etc.) to filter out fake robot movies (X-Men Apocalyse, really?)
- Find average rating of robot movies, overall and by year

Thank You!
  ========================================================
  
  [<img src="mass-mutual-logo.png" alt="Mass Mutual Financial Group" style="height: 150px;"/>](https://www.massmutual.com/)

[Western Mass Statistics and Data Science Meetup](http://www.meetup.com/Pioneer-Valley-and-Five-College-R-Statistical-Meetup/)

***
  
  [<img src="gwis-logo.png" alt="Graduate Women In STEM" style="height: 150px;"/>](http://blogs.umass.edu/gwis/)

[<img src="grid-logo.png" alt="Graduate Researchers in Data" style="height: 150px;"/>](http://gridclub.io/)
