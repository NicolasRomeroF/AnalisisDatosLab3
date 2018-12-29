library(arulesViz)
library(dplyr)
library(rgl)

#path = "F:/Google Drive/USACH/Nivel 8/Analisis de datos/lab2/hepatitis.data"
path = "~/Documentos/AnalisisDatosLab3/hepatitis.data"
hepatitis <- read.table(path,sep=",", na.strings = c("?"))

names <- c("CLASS","AGE","SEX","STEROID","ANTIVIRALS","FATIGUE","MALAISE",
           "ANOREXIA","LIVER_BIG","LIVER_FIRM","SPLEEN_PALPABLE","SPIDERS",
           "ASCITES","VARICES","BILIRUBIN","ALK_PHOSPHATE","SGOT","ALBUMIN",
           "PROTIME","HISTOLOGY")

colnames(hepatitis) <- names

hepatitis.without.na <- na.omit(hepatitis)

data = select(hepatitis.without.na,-CLASS)
data[["SEX"]] = factor(data[["SEX"]])
data[["STEROID"]] = factor(data[["STEROID"]])
data[["ANTIVIRALS"]] = factor(data[["ANTIVIRALS"]])
data[["FATIGUE"]] = factor(data[["FATIGUE"]])
data[["MALAISE"]] = factor(data[["MALAISE"]])
data[["ANOREXIA"]] = factor(data[["ANOREXIA"]])
data[["LIVER_BIG"]] = factor(data[["LIVER_BIG"]])
data[["LIVER_FIRM"]] = factor(data[["LIVER_FIRM"]])
data[["SPLEEN_PALPABLE"]] = factor(data[["SPLEEN_PALPABLE"]])
data[["SPIDERS"]] = factor(data[["SPIDERS"]])
data[["ASCITES"]] = factor(data[["ASCITES"]])
data[["VARICES"]] = factor(data[["VARICES"]])
data[["HISTOLOGY"]] = factor(data[["HISTOLOGY"]])

ruleExplorer(data)
