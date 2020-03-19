library(arules)

# Reads the csv as baskets
tr <- read.transactions("~/rstudio/association-mining/dataset/user_data_basket.csv",format="basket",sep=",")

# Initial analysis of the data
summary(tr)

# Histogram
itemFrequencyPlot(tr,topN=10)

## User analysis

# To form rules, we need to tune our parameters

# 8 rules
rules <- apriori(tr, parameter= list(supp=0.4, conf=0.5))

# 76 rules - optimal
rules <- apriori(tr, parameter= list(supp=0.3, conf=0.5))

# 661 rules
rules <- apriori(tr, parameter= list(supp=0.2, conf=0.5))

# Setting the optimal number
rules <- apriori(tr, parameter= list(supp=0.3, conf=0.5))
# Shows the rules created
inspect(rules)
# Shows only top 15 rules
inspect(sort(rules,by='lift')[1:15])

# Show item set creating rules
itemsets <- unique(generatingItemsets(rules))
write(itemsets)

# Write all of the rules
write(sort(rules,by='lift'),file="~/rstudio/association-mining/rules/user-rules.txt")

maximal.sets <- apriori(tr, parameter= list(supp=0.3, conf=0.5, target="maximally frequent itemsets"))
write(maximal.sets)
write(maximal.sets,file="~/rstudio/association-mining/rules/user-maximal-sets.txt")

## Session level analysis

# Reads the csv as baskets
tr=read.transactions("~/rstudio/association-mining/dataset/session_data_basket.csv",format="basket",sep=",")
 
# Initial analysis of the data
summary(tr)

# Histogram
itemFrequencyPlot(tr,topN=10)

# To form our rules, we again must tune our parameters

# 3 rules
rules <- apriori(tr, parameter= list(supp=0.4, conf=0.5))

# 5 rules
rules <- apriori(tr, parameter= list(supp=0.3, conf=0.5))

# 20 rules - optimal
rules <- apriori(tr, parameter= list(supp=0.2, conf=0.5))

# 93 rules
rules <- apriori(tr, parameter= list(supp=0.1, conf=0.5))

# Settings the optimal number
rules <- apriori(tr, parameter= list(supp=0.2, conf=0.5))
inspect(sort(rules,by='lift')[1:15])

# Show itemsets generating rules
itemsets <- unique(generatingItemsets(rules))
write(itemsets)

# Write all rules
write(sort(rules,by='lift'),file="~/rstudio/association-mining/rules/session-rules.txt")

# To get maximally frequent itemsets
maximal.sets <- apriori(tr, parameter= list(supp=0.2, conf=0.5, target="maximally frequent itemsets"))
write(maximal.sets)
write(maximal.sets,file="~/rstudio/association-mining/rules/session-maximal-sets.txt")