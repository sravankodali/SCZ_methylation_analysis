library("ChAMP")
library(dplyr)
library(tidyr)
library(sva)

myLoad = champ.load(directory = getwd(),
                    method="ChAMP",
                    methValue="B",
                    autoimpute=TRUE,
                    filterDetP=TRUE,
                    ProbeCutoff=0,
                    SampleCutoff=0.05,
                    detPcut=0.01,
                    filterBeads=TRUE,
                    beadCutoff=0.05,
                    filterNoCG=TRUE,
                    filterSNPs=TRUE,
                    population=NULL,
                    filterMultiHit=TRUE,
                    filterXY=TRUE,
                    force=FALSE,
                    arraytype="450K")

#Data normalization
myNorm <- champ.norm(beta=myLoad$beta,
                     arraytype="450K",
                     method='BMIQ',
                     cores=4)


