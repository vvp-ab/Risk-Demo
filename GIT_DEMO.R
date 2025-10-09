# Function to ensure required packages are installed & loaded
ensure_package <- function(pkg) {
  # If the package is not installed, install it
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  # Load the package
  library(pkg, character.only = TRUE)
}

# Ensure DBI and odbc are available, these are used for interacting with Snowflake from R
ensure_package("DBI")
ensure_package("odbc")

# Function to insert a row into GIT_DEMO
insert_into_git_demo <- function(con, message, participant_name, rate_the_demo) {
  query <- "
    INSERT INTO SANDBOX.RISK.GIT_DEMO (MESSAGE, PARTICIPANT_NAME, RATE_THE_DEMO)
    VALUES (?, ?, ?)
  "
  dbExecute(con, query, params = list(message, participant_name, rate_the_demo))
}

# Function to delete all rows from GIT_DEMO
clear_git_demo <- function(con) {
  query <- "DELETE FROM SANDBOX.RISK.GIT_DEMO"
  dbExecute(con, query)
}
