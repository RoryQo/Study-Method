# Bayesian Analysis of Study Methods

## Table of Contents
1. [Context](#context)
2. [Results](#results)
3. [Analysis Methodology](#analysis-methodology)
4. [Data and Simulation](#data-and-simulation)
5. [Findings](#findings)

## Context
In a science classroom, 32 students were randomly assigned to two different study methods (A and B), with 16 students in each group. After several weeks of study, the students took a test designed to yield an average score of 75% with a standard deviation of 10. Group A scored an average of 75.2 with a standard deviation of 7.3, while Group B scored an average of 77.5 with a standard deviation of 8.1.

## Results
To evaluate the effectiveness of the study methods, we employed a conjugate normal prior with a mean $\mu\$ of 75 and a standard deviation $\sigma\$ of 10, based on the test parameters. Using Monte Carlo sampling, we calculated the probability that study method A is worse than method B given the data. As the sample size increases, the prior strength increases, which in turn reduces the uncertainty regarding the superiority of group A. Despite increasing sample sizes (up to 60 students per group), the probability that study method A is worse than method B remains significant at approximately 65%.

## Analysis Methodology
We utilized a Bayesian framework with Monte Carlo simulations to analyze the data and derive probabilities for the two study methods. The simulations allowed us to estimate the posterior distributions of the average scores for both methods and to calculate the probability that one method is better than the other.

## Data and Simulation
The following parameters were set based on the problem statement:
- Sample size for each group: \(n = 16\)
- Average scores and standard deviations for groups A and B
- Prior parameters for Bayesian analysis

The simulation involved iterating through different prior sample sizes and computing the posterior distributions for both groups using Monte Carlo methods.

```{r}
# Monte Carlo simulation for probabilities
probs <- c()
for (i in 1:length(k0)) {
  # Monte Carlo simulation for Group A
  mu_na <- (k0[i] * mu0 + n * ya) / (k0[i] + n)
  var_na <- 1 / (v0[i] + n) * (v0[i] * s20 + (n - 1) * sa^2 + (k0[i] * n) / (k0[i] + n) * (ya - mu0)^2)
  s_postsample_a <- sqrt(1 / rgamma(10000, (v0[i] + n) / 2, var_na * (v0[i] + n) / 2))
  theta_postsample_a <- rnorm(10000, mu_na, s_postsample_a / sqrt(k0[i] + n))

  # Monte Carlo simulation for Group B
  mu_nb <- (k0[i] * mu0 + n * yb) / (k0[i] + n)
  var_nb <- 1 / (v0[i] + n) * (v0[i] * s20 + (n - 1) * sb^2 + (k0[i] * n) / (k0[i] + n) * (yb - mu0)^2)
  s_postsample_b <- sqrt(1 / rgamma(10000, (v0[i] + n) / 2, var_nb * (v0[i] + n) / 2))
  theta_postsample_b <- rnorm(10000, mu_nb, s_postsample_b / sqrt(k0[i] + n))

  # Calculate probability that theta_A < theta_B
  mean_prob <- mean(theta_postsample_a < theta_postsample_b)
  probs <- c(probs, mean_prob)
}
```

## Findings
The results were visualized in a plot displaying the relationship between the prior sample size $\(v_0 = k_0)\$ and the calculated probabilities of group A's performance being worse than that of group B. This plot illustrates how the certainty in our analysis changes as we adjust our prior assumptions.

<img src="https://raw.githubusercontent.com/RoryQo/R-Study-Method/main/Graph1.jpg" alt="Graph 1" width="700px" />


