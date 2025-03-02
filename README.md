# Bayesian Analysis of Study Methods

## Table of Contents
1. [Context](#context)  
2. [Analysis Methodology](#analysis-methodology)  
3. [Results and Findings](#results-and-findings)

## Context
In a science classroom, 32 students were randomly assigned to two different study methods (A and B), with 16 students in each group. After several weeks of study, the students took a test designed to yield an average score of 75% with a standard deviation of 10%. Group A scored an average of 75.2% with a standard deviation of 7.3%, while Group B scored an average of 77.5% with a standard deviation of 8.1%.

We wish to compare the performance of the two study methods by estimating the probability that study method A performs worse than study method B using a Bayesian framework.

## Analysis Methodology
We apply **Bayesian statistics** to infer the true underlying parameters of the test scores for both groups. Specifically, we use **Monte Carlo simulation** to estimate the posterior distributions of the mean scores for both groups, given the observed data.

### Prior Assumptions
We assume the following conjugate normal prior for both groups:

$$
\mu \sim \mathcal{N}(\mu_0, \sigma_0^2)
$$

Where $\mu_0 = 75$ is the prior mean (based on the test’s expected score), and $\sigma_0 = 10$ is the prior standard deviation. We assume a **normal likelihood** for the data with the mean and variance of each group’s scores.

### Monte Carlo Simulation
For each group (A and B), we compute the posterior distribution of the mean $\mu$ using Monte Carlo sampling. We iteratively sample from the posterior distributions, and for each iteration, we calculate the probability that the mean score for group A is less than the mean score for group B:

```math
P(\mu_A < \mu_B \mid \text{data}) = \frac{1}{N} \sum_{i=1}^{N} I(\mu_A^{(i)} < \mu_B^{(i)})
```

Where \( N \) is the number of simulations, and \( I \) is the indicator function that takes the value 1 when the condition inside is true and 0 otherwise. The resulting probability gives us an estimate of how likely it is that study method A is inferior to study method B.

## Results and Findings
The **Monte Carlo simulation** was performed across different prior strengths (values of $k_0$ and $v_0$), and the resulting probabilities represent the likelihood that study method A is worse than study method B, given the observed data. 



### Key Results:
- **Posterior Probabilities**: The posterior probabilities, $\( P(\mu_A < \mu_B) \)$, were calculated for each prior assumption. These probabilities remained relatively stable, around **65%**, even with larger sample sizes (up to 60 students per group). This indicates that, despite increasing data, the evidence suggests that study method B is superior to study method A with high probability.

### Effect of Prior Strength:
As we increased the prior strength (increasing $k_0$ and $v_0$), the estimates became more stable and less sensitive to the observed data, demonstrating how stronger prior assumptions reduce uncertainty in the analysis.

### Visualization:
Below is a plot showing the relationship between the prior strength ($\ v_0 = k_0 $) and the posterior probability $\( P(\mu_A < \mu_B) \)$. This demonstrates how the certainty of the results increases as the strength of the prior increases.

![Graph1](https://raw.githubusercontent.com/RoryQo/R-Study-Method/main/Graph1.jpg)

### Interpretation:
Based on the Bayesian analysis, we find that study method B appears to be slightly superior to study method A. The probability that study method A is worse than study method B remains stable at approximately **65%** even as the sample size increases. This result suggests that the difference in effectiveness between the two study methods is moderate but consistent. The plot further illustrates the role of prior assumptions, showing how more information (stronger priors) stabilizes the results.
