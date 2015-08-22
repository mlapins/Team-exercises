
col1 <- c("FHB", "FHB", "Invest", "Invest", "prop", "prop")

col2 <- c("LMI-good", "LMI-bad", "LMI-good", "LMI-bad","LMI-good", "LMI-bad")

Col3 <- as.numeric(c(13,38,46,35,63,4))

#Create dataframe from vectors above

df <- data.frame(col1, col2, Col3)

#Change column names

names(df) <- c("Buyer", "result","count")

#Change the levels in the first column to "First Home Buyer", "Investor", "Refinancer"
levels(df$Buyer) <- c("First.Home.Buyer", "Investor", "Refinancer")

#Print the dataframe
df

#This is what you should end up with

#Buyer   result count
#1 First Home Buyer LMI-good    13
#2 First Home Buyer  LMI-bad    38
#3         Investor LMI-good    46
#4         Investor  LMI-bad    35
#5       Refinancer LMI-good    63
#6       Refinancer  LMI-bad     4


# Subset and start filtering data

df1 <- df[df$result == "LMI-good", ]

#add percentages column to dataframe

df$count_percent <- df$count / 100

#Print the dataframe
df



#Summarise data using tapply

result <- tapply(df$count, list(df$Buyer,df$result), mean)

# plot the results <- t(result)

barplot(result, beside = FALSE, legend = rownames(result))



#Get count for plotting. Reshape grouping - Summarise using tapply and converting to a dataframe

#df2 <- data.frame(tapply(df$count, list(df$Buyer,df$result), matrix))


df3 <- melt(df, id=c("Buyer","result"), measured="count")


df4 <- t(df3)

tapply(df2[,3], list(df2[,1],df2[,2]), mean)


qplot(factor(df2$Investor))

class(df2)

library(ggplot2)



#How to reshape data.
library(reshape)

df2 <- t(df)

