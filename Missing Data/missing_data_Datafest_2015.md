Intro to Missing Data Techniques
========================================================
author: Kate Aloisio  
date: 3/10/2015

What is missing data?
========================================================
- Any observation (row) without a corresponding response in any variable (column)  
- A common problem
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
is.na(x)
```

```
[1] FALSE FALSE FALSE  TRUE
```
What do you think this will return?

```r
y <- c("k", "A", NA, "NA")
is.na(y)
```

Testing for Missing Values
========================================

```r
y <- c("k", "A", NA, "NA")
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
Oh no!

Excluding Missing Values from Analysis
========================================
How do we exclude missing values?

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

Excluding Missing Values from Analysis
========================================
How do we exclude missing values?

```r
(x_clean <- x[!is.na(x)])
```

```
[1] 1 2 9
```

```r
mean(x_clean) # subset to remove NA
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

Excluding Missing Values from Analysis
========================================
Some functions can handle NA

```r
summary(x) 
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    1.0     1.5     2.0     4.0     5.5     9.0       1 
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
na.exclude(ds) # can be different in some prediction and residual functions
```

```
  x y
1 1 k
2 2 A
```

NA options (cont.)
==========================================

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

```r
na.fail(ds) # returns the object only if it contains no missing values
```

```
Error: missing values in object
```

Advanced Methods
========================================
Imputation

> The English verb "to impute" comes from the Latin
> imputo, which means to reckon, attribute, make account
> of, charge, ascribe. In the Bible, the word "impute" is a
> translation of the Hebrew verb hashab, which appears
> about 120 times in the Old Testament in various
> meanings (van Buuren, 2012).

Simple imputation
========================================

```r
x <- c(1, 2, 5, 10, NA, 6, 1)
x2 <- x
is.na(x2)
```

```
[1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
```

```r
x2[is.na(x2)]
```

```
[1] NA
```

```r
mean(x2, na.rm=TRUE)
```

```
[1] 4.167
```

Simple imputation
========================================

```r
x2[is.na(x2)] <- mean(x2, na.rm = TRUE)
x2
```

```
[1]  1.000  2.000  5.000 10.000  4.167  6.000  1.000
```

Random imputation
========================================

```r
x3 <- x
x3[!is.na(x3)]  # values from which we can sample
```

```
[1]  1  2  5 10  6  1
```

```r
x3[is.na(x3)] <- sample(x3[!is.na(x3)], 
                 size = sum(is.na(x3)), 
                 replace = TRUE)
x3
```

```
[1]  1  2  5 10  1  6  1
```

Multiple imputation
========================================
Preserves both mean and variance of variables.

Three step process

1. Imputation: Generate a set of m = 1 plausible values to "fill-in" the missing values
2. Analysis: Analyze the m datasets using complete--case methods
3. Combination: Combine the results from the m analyses

Check out the package 'mice' for more info.


NA versus NULL
========================================
NULL
- Represents a null object
- Returned by expressions and functions whose values are undefined
- Reserved word
- Not allowed in a vector


Example NA vs NULL
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
***

```r
NULL
class(NULL)
```

```
[1] "NULL"
```

Example NA vs NULL
========================================================

```r
v <- c(1, NA, NULL)
v
```

```
[1]  1 NA
```

Caution using NULL
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
ds$x <- NULL
ds
```

```
     y
1    k
2    A
3 <NA>
4 <NA>
```

References
=========================================================
- Quick-R: http://www.statmethods.net/input/missingdata.html
- UCLA: Statistical Consulting Group.: http://www.ats.ucla.edu/stat/r/faq/missing.htm
- http://thomasleeper.com/Rcourse/Tutorials/NAhandling.html
- Flexible Imputation of Missing Data by Stef van Buuren (2012)


