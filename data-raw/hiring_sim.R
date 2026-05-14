## data-raw/hiring_sim.R
## Generates the hiring_sim dataset included in AIGovernance
## Run once: source("data-raw/hiring_sim.R")

set.seed(2026)

n <- 500

race_groups <- c("White", "Black", "Hispanic", "Asian", "Other")
race_probs  <- c(0.45, 0.20, 0.18, 0.12, 0.05)

# selection probabilities by race (produces realistic AIR patterns)
sel_prob <- c(White = 0.42, Black = 0.28, Hispanic = 0.30,
              Asian = 0.38, Other = 0.32)

race_eth <- sample(race_groups, n, replace = TRUE, prob = race_probs)
gender   <- sample(c("Male", "Female"), n, replace = TRUE, prob = c(0.55, 0.45))

years_exp <- pmax(0, round(rnorm(n, mean = 5, sd = 3), 1))
score     <- pmin(100, pmax(0, round(
  50 + 4 * years_exp +
    ifelse(race_eth == "White", 3, ifelse(race_eth == "Asian", 2, -1)) +
    rnorm(n, 0, 12), 1
)))

prob_sel  <- sel_prob[race_eth]
selected  <- rbinom(n, 1, prob_sel)

hiring_sim <- data.frame(
  applicant_id   = seq_len(n),
  race_ethnicity = race_eth,
  gender         = gender,
  years_experience = years_exp,
  score          = score,
  selected       = selected,
  stringsAsFactors = FALSE
)

usethis::use_data(hiring_sim, overwrite = TRUE)
cat("hiring_sim saved:", nrow(hiring_sim), "rows\n")
cat("Selection rates:\n")
print(tapply(hiring_sim$selected, hiring_sim$race_ethnicity, mean))
