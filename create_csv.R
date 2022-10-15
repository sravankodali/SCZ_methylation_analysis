#command line
# tar -xvf GSE74193_RAW.tar
# gunzip *.gz

library("ChAMP")
library(dplyr)
library(tidyr)

filenames <- list.files(getwd(), pattern="*.idat", full.names=TRUE)
filenames = sub(".*74193/", "", filenames)
filenames = sub("_Red.*", "", filenames)
filenames = sub("_Grn.*", "", filenames)
filenames= unique(filenames)
filenames = as.data.frame(filenames)
filenames = filenames %>% separate(filenames, c("Accession", "Slide", "Array"), sep='_')

#make new columns
filenames$Sample_Name=NA
filenames$Sample_Plate=NA
filenames$Sample_Group=NA
filenames$Pool_ID=NA
filenames$Project=NA
filenames$Sample_Well=NA

filenames=filenames[,c(4,5,6,7,8,9,2,3,1)]

sample_74193=read.csv("C:\\Users\\Public\\SampleSheet.CSV")
samplenames=sample_74193$Title
samplenames = sub("_Control.*", "", samplenames)
samplenames = sub("_Schizo.*", "", samplenames)
print(samplenames)

filenames$Sample_Name = samplenames



samplenames=sample_74193$Title
samplenames_group = sub(".*Control/", "", samplenames)
print(samplenames_group)
filenames = as.data.frame(filenames)
filenames$Sample_Group= ifelse(grepl('Control', samplenames) == TRUE, 'C', 'S')

write.csv(filenames, 'SampleSheet.csv',row.names = FALSE)
