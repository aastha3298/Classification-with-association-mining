library(arules)
library(plyr)
user_data <- read_csv("~/dataset/user_data.csv")
df_user <- user_data
df_user1 = ddply(df_user, c("user_id"), function(dfl)paste(dfl$milestone_name, collapse=","))
df_user1$user_id = NULL
write.table(df_user1, "dataset/user_data_basket.csv", quote=FALSE, row.names = FALSE, col.names = FALSE)
user_data <- read_csv("dataset/session_data.csv")
df_user <- user_data
df_user1 = ddply(df_user, c("session_id"), function(dfl)paste(dfl$milestone_name, collapse=","))
df_user1$session_id = NULL
write.table(df_user1, "dataset/session_data_basket.csv", quote=FALSE, row.names = FALSE, col.names = FALSE)
