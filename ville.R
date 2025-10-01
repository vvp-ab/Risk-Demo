source("./GIT_DEMO.R")
source("./ENV.R")

con <- connect_to_snowflake()

data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)

Name <- "ville"
Message <- "Very good demo wow thank you"
Rating <- 10

insert_into_git_demo(con, Message, Name, Rating)

data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)

dbDisconnect(con)
