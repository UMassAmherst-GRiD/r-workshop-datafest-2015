## ----setup, echo = FALSE-------------------------------------------------
for(pkg in c("knitr", "ggplot2", "dplyr")) {
  if(!require(pkg)) {
    install.packages(pkg)
    library(pkg)
  }
}


## ----linfun--------------------------------------------------------------
nn = 35
xdat = runif(nn, 0, 10)
b0 = 2
b1 = 1/2
sd = b1
set.seed(4321)
lindat = data.frame(x = xdat, y1 = xdat * b1 + b0, 
                    y2 = xdat * b1 + b0 + rnorm(nn, 0, sd),
                    y3 = xdat * b1 + b0 + rnorm(nn, 0, sd * 4))

g1 = ggplot(lindat, aes(x = x, y = y1)) + 
  scale_x_continuous(limits = c(0, 10)) + scale_y_continuous(limits = c(0, 10)) +
  geom_hline(aes(yintercept = 0), weight = 2) +
  geom_vline(aes(xintercept = 0), weight = 2) + 
  theme_minimal()
g1

## ------------------------------------------------------------------------
# Linear function
g1 + geom_abline(aes(intercept = b0, slope = b1), show_guide = TRUE) + 
  annotate("text", x = 2, y = 5, label = paste0("a = ", b1, ", b = ", b0))


## ------------------------------------------------------------------------

# Some perfect linear data
g1 + geom_point(aes(x = x, y = y1))


## ------------------------------------------------------------------------
# A perfect model for the data
g1 + geom_point(aes(x = x, y = y1)) + 
  geom_abline(aes(intercept = b0, slope = b1), show_guide = TRUE) + 
  annotate("text", x = 2, y = 5, label = paste0("a = ", b1, ", b = ", b0))


## ------------------------------------------------------------------------
# In reality, we start with the (noisy) data, and we want to get the function

g2 = ggplot(lindat, aes(x = x, y = y2)) + 
  scale_x_continuous(limits = c(0, 10)) + scale_y_continuous(limits = c(0, 10)) +
  geom_hline(aes(yintercept = 0), weight = 2) +
  geom_vline(aes(xintercept = 0), weight = 2) + 
  theme_minimal()

g2 + geom_point()

## ------------------------------------------------------------------------
g2  + geom_point() + stat_smooth(method = "lm")

## ------------------------------------------------------------------------
g2 + geom_point() + stat_smooth(method = "lm") +
  geom_abline(aes(intercept = b0, slope = b1), linetype = 2)

## ------------------------------------------------------------------------
g3 = ggplot(lindat, aes(x = x, y = y3)) + 
  scale_x_continuous(limits = c(0, 10)) + scale_y_continuous(limits = c(-4, 10)) +
  geom_hline(aes(yintercept = 0), weight = 2) +
  geom_vline(aes(xintercept = 0), weight = 2) + 
  theme_minimal()

g3 + geom_point()

## ------------------------------------------------------------------------

g3 + geom_point() + stat_smooth(method = "lm") +
  geom_abline(aes(intercept = b0, slope = b1), linetype = 2)


## ----, echo = TRUE-------------------------------------------------------
data(state)
kable(head(state.x77))

## ----, echo = TRUE-------------------------------------------------------
state = state.x77 %>%
  as.data.frame() %>%
  setNames(c("pop", "inc", "illit", "lExp", "murder", "hsGrad", "frost", "area"))
kable(head(state))

## ------------------------------------------------------------------------
pairs(state)

## ----, echo = TRUE-------------------------------------------------------
mod1 = lm(lExp ~ hsGrad, state)
mod2 = lm(lExp ~ murder + hsGrad, state)
mod3 = lm(lExp ~ murder + hsGrad + illit, state)

## ------------------------------------------------------------------------
pairs(state)

## ----, echo = FALSE------------------------------------------------------
summary(mod1)

## ----, echo = FALSE------------------------------------------------------
summary(mod2)

## ----, echo = FALSE------------------------------------------------------
summary(mod3)

## ----, echo = TRUE-------------------------------------------------------
par(mfrow = c(1, 2))
termplot(mod2, partial.resid = TRUE)
par(mfrow = c(1, 1))

## ------------------------------------------------------------------------
qplot(mod2$residuals, binwidth = 0.3)

## ----, echo = TRUE-------------------------------------------------------
newdat = data.frame(murder = 9, hsGrad = 77)
kable(newdat)

## ----, echo = TRUE-------------------------------------------------------
predict(mod2, newdat, se.fit = TRUE) %>%
  as.data.frame() %>%
  kable()

