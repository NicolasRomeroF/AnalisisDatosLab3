library(arulesViz)
library(dplyr)
library(rgl)

path = "F:/Google Drive/USACH/Nivel 8/Analisis de datos/lab3/hepatitis.data"
#path = "~/Documentos/AnalisisDatosLab3/hepatitis.data"
hepatitis <- read.table(path,sep=",", na.strings = c("?"))

names <- c("CLASS","AGE","SEX","STEROID","ANTIVIRALS","FATIGUE","MALAISE",
           "ANOREXIA","LIVER_BIG","LIVER_FIRM","SPLEEN_PALPABLE","SPIDERS",
           "ASCITES","VARICES","BILIRUBIN","ALK_PHOSPHATE","SGOT","ALBUMIN",
           "PROTIME","HISTOLOGY")

colnames(hepatitis) <- names

hepatitis.without.na <- na.omit(hepatitis)
data = hepatitis.without.na
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
data[["CLASS"]] = factor(data[["CLASS"]])

# 
# frequentItems <- eclat (data, parameter = list(supp = 0.2, minlen=3, maxlen = 4))
# inspect(frequentItems)



rules <- apriori(data, parameter=list(support=0.2, confidence=0.8, minlen=3, maxlen=6))
rules
subsetRules <- which(colSums(is.subset(rules, rules)) > 1) # get subset rules in vector
length(subsetRules)  #> 3913
rules <- rules[-subsetRules] # remove subset rules.

rules_conf <- sort (rules, by="confidence", decreasing=TRUE) # 'high-confidence' rules.
inspect(head(rules_conf))

rules_lift <- sort (rules, by="lift", decreasing=TRUE) # 'high-lift' rules.
inspect(head(rules_lift))
a = ruleExplorer(rules)
print(a)