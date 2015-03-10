Intro to Missing Data Techniques
========================================================
author: Kate Aloisio  
date: 3/17/2015

What is missing data?
========================================================

- May be due to design or happenstance
- Ignoring missing data may lead to inefficiency 
- Ignoring missing data may lead to bias
- Important to identify possible selection or biasing issues comparing subjects with missing data with complete data subjects

Types of missing data
========================================================

- Missingness does not depend on observed or unobserved covariates (data fell from the truck)

- Missingness does not depend on unobserved covariates (a subject was hospitalized for high cholesterol)

- Missingness depends on unobserved quantities (a subject missed their appointment because they were too sick to get out of bed)

Missing values in R
========================================================
- Denoted NA; Logical constant of length 1 which contains a missing value indicator

```r
NA
```

```
[1] NA
```

```r
class(NA)
```

```
[1] "logical"
```

```r
NA > 1 
```

```
[1] NA
```
Missing values in R (cont)
==========================================================
- Reserved word in R

```r
NA <- 5
```

```
Error: invalid (do_set) left-hand side to assignment
```

Testing for Missing Values
========================================

```r
x <- c(1, 2, 9, NA)
y <- c("k", "A", NA, "NA")
is.na(x)
```

```
[1] FALSE FALSE FALSE  TRUE
```
What do you think this will return?

```r
is.na(y)
```

Testing for Missing Values
========================================

```r
x <- c(1, 2, 9, NA)
y <- c("k", "A", NA, "NA")
is.na(x)
```

```
[1] FALSE FALSE FALSE  TRUE
```

```r
is.na(y)
```

```
[1] FALSE FALSE  TRUE FALSE
```
Recoding Values to Missing
========================================

```r
x <- c(1, 2, 9, NA)
y <- c("k", "A", NA, "NA")
ds <- as.data.frame(cbind(x, y))
ds
```

```
     x    y
1    1    k
2    2    A
3    9 <NA>
4 <NA>   NA
```
Recoding Values to Missing (cont)
========================================
Let's replace the character "NA" with the symbol NA

```r
ds$y[ds$y=="NA"] <- NA
ds
```

```
     x    y
1    1    k
2    2    A
3    9 <NA>
4 <NA> <NA>
```

Excluding Missing Values from Analysis
========================================

```r
x <- c(1, 2, 9, NA)
mean(x)
```

```
[1] NA
```

```r
x[x != NA] # returns all NA
```

```
[1] NA NA NA NA
```

```r
x[!is.na(x)]
```

```
[1] 1 2 9
```

```r
mean(x[!is.na(x)]) # subset to remove NA
```

```
[1] 4
```

```r
mean(x, na.rm=TRUE) # use arguments to remove NA
```

```
[1] 4
```

Complete Case 
========================================

```r
ds
```

```
     x    y
1    1    k
2    2    A
3    9 <NA>
4 <NA> <NA>
```

```r
ds[!complete.cases(ds),] # returns cases with missing values
```

```
     x    y
3    9 <NA>
4 <NA> <NA>
```

```r
ds[complete.cases(ds),] # returns only complete cases
```

```
  x y
1 1 k
2 2 A
```

NA options in R
==========================================

```r
na.omit(ds)
```

```
  x y
1 1 k
2 2 A
```

```r
mean(na.omit(ds$x)) # use NA options
```

```
[1] NA
```

```r
na.exclude(ds) # can be different in some prediction and residual functions
```

```
  x y
1 1 k
2 2 A
```

```r
na.pass(ds) # returns the object unchanged
```

```
     x    y
1    1    k
2    2    A
3    9 <NA>
4 <NA> <NA>
```

NA options (cont.)
==========================================

```r
# na.fail(ds) # returns the object only if it contains no missing values
```

Advanced Methods
========================================
Imputation




***
NULL
- Represents a null object
- Returned by expressions and functions whose values are undefined
- Reserved word
- Not allowed in a vector


Examples NA vs NULL
========================================================

```r
NA
```

```
[1] NA
```

```r
class(NA)
```

```
[1] "logical"
```

```r
NA > 1
```

```
[1] NA
```

```r
# NA <- 5
```
***

```r
NULL
class(NULL)
```

```
[1] "NULL"
```

```r
NULL > 1
```

```
logical(0)
```

```r
# NULL <- 5
v <- c(1, NA, NULL)
v
```

```
[1]  1 NA
```

Caution using NULL
========================================

```r
x <- c(1, 2, 9, NA)
y <- c("k", "A", NA, "NA")
ds <- as.data.frame(cbind(x, y))
ds
```

```
     x    y
1    1    k
2    2    A
3    9 <NA>
4 <NA>   NA
```

```r
ds$x <- NULL
ds
```

```
     y
1    k
2    A
3 <NA>
4   NA
```




