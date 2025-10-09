source("./GIT_DEMO.R")
source("./ENV.R")

con <- connect_to_snowflake()

# Query for inital state of the table containing demo reviews
data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)

# Name of reviewer, their feedback about the demo and rating (1-10)
Name <- "Ålands Banker"
Message <- "Commit denied. Your code has been deemed suboptimal by the Central Committee of Snowflake."
Rating <- -999

# Updates SANDBOX.RISK.GIT_DEMO table with the new review
insert_into_git_demo(con, Message, Name, Rating)

# Query for updated state of the table containing demo reviews
data <- dbGetQuery(con, "SELECT * FROM SANDBOX.RISK.GIT_DEMO")

print(data)

dbDisconnect(con)
