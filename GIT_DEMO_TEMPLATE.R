source("./GIT_DEMO.R")
source("./ENV.R")

con <- connect_to_snowflake()

data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)

Name <- "Lord Commander Vilburg"
Message <- "Git gud"
Rating <- 10

insert_into_git_demo(con, Message, Name, Rating)

data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)
                              
dbDisconnect(con)
