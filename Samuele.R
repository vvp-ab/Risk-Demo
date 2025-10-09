# Calculate the inverse CDF (quantile) for the standard normal distribution
p <- 0.999
R <- 0.15
part1 <- -1/(sqrt(R))*qnorm(p) 

part2 <- + sqrt((1-R)/R)*sqrt( (qnorm(p))^2 -log(1-R)) 

result <- pnorm(part1 + part2)

# Print the result
print(result)