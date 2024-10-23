### Rscript for Randomization Schema ###################################################################
## by Ludiah Bagakas 

#https://search.r-project.org/CRAN/refmans/carat/html/StrPBR.html
#randomizeR: An R Package for the Assessment and Implementation of Randomization in Clinical Trials

#libraries
library(randomizeR)

#error code
h <- function() stop("k is not an integer!", call. = FALSE)
i <- function() stop("ratio is not an integer!", call. = FALSE)

#specify parameters
n=subjects.per.site=20
S=sites=list('AAA','BBB')
r=length(sites)
B=blksize = 3
N=treatments = 1 #ratio of treatment to control
if (B%%N!=0){h()}
D=control = 1

#permuted block randomization
set.seed(777)
pbr = pbrPar(replicate(n/B, B), K = 2, ratio = c(B*(N/(N+D)), B*(D/(N+D))), groups = c('T', 'C'))
gs = genSeq(pbr, r = length(sites), seed = 777)
DF = getRandList(gs)

row.names(DF) =sites

#generate randomization schema
for (name in rownames(DF)) {
  j = 0
  for (i in DF[name,]) {
    j = j + 1
    DF[name, j] = paste0(name, sprintf('%0*d', ceiling(log(r)/log(10)), j), i)
  }
}


#data output
write.csv(t(DF), "C:/Users/lmnba/OneDrive/Documents/STA 635/Randomization Schema/RS3.csv")


