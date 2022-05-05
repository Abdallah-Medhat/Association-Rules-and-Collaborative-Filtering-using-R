#library
#install.packages("arules")
#install.packages("arulesViz")
library(arules)
library(arulesViz)
#read data and look at on some coulmns data
Trans <- read.transactions("transactions.csv", format = "basket", sep = ",", skip=1, 
                           rm.duplicates = FALSE)
class(Trans)
inspect(Trans)
summary(Trans)
inspect(head(Trans, 12))
inspect(Trans[1:5])
# plot of the top 10 transactions 
itemFrequency(Trans[, 1:10])
itemFrequencyPlot(Trans, topN = 10)
#plot items frquency based on support
itemFrequencyPlot(Trans, support = 0.1)
#plot random sample from transactions (100)
image(sample(Trans, 100))
#Generate association rules maxlength =3
apriori_trans <- apriori(Trans, parameter = list(support = 0.002, 
                                                 confidence = 0.20, maxlen = 3))
apriori_trans
inspect(apriori_trans[1:5])
inspect(sort(apriori_trans, by = "lift")[1:5])
# writing the rules to a CSV file
write(apriori_trans, file = "apriori_trans.csv",
      sep = ",", quote = TRUE, row.names = FALSE)
# converting the rule set to a data frame
apriori_trans_df <- as(apriori_trans, "data.frame")
str(apriori_trans_df)
#Generate association rules with maxlength =2
apriori_trans1 <- apriori(Trans, parameter = list(support = 0.002, 
                                                  confidence = 0.20, maxlen = 2))
apriori_trans1
summary(apriori_trans1)
inspect(apriori_trans1[1:5])
inspect(sort(apriori_trans1, by = "lift")[1:5])
# writing the rules to a CSV file
write(apriori_trans1, file = "apriori_trans1.csv",
      sep = ",", quote = TRUE, row.names = FALSE)
# converting the rule set to a data frame
apriori_trans_df1 <- as(apriori_trans1, "data.frame")
str(apriori_trans_df1)
