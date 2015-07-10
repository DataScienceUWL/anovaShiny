# ANOVA Demo Shiny App

This is based on the shiny app at [https://gist.github.com/yihui/3989195].

Draws 3 samples from normal distributions, each of size n, with the specified mean and common standard deviation.  Displays visualization of the data by group and the ANOVA table.

```
rm(list=ls()) )
require(shiny)
runGitHub("anovaShiny,"DataScienceUWL")
```