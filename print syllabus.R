setwd("/Users/randigarcia/Dropbox/Smith-Teaching/SDS-201/Spring2017/www")
library(knitr)
pandoc(knit("syllabus.Rmd"), format="latex")

getwd()
setwd("/Users/rgarcia")
purl("Dropbox/Smith-Teaching/SDS-201/Spring2017/www/lectures/29_mlr_diagnostics.Rnw", documentation = FALSE)


/Users/randigarcia/Dropbox