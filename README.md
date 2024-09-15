# R-Bayesian-Analysis

#### Context

32 students in a science classroom were randomly assigned to different study methods (A and B), number of students in each group is 16.  after weeks of studying they were given a test designed to yeild an average score of 75% with a standard deviation of 10.  Group A scored an average of 75.2 with a standard deviation of 7.3, and group B scored an average of 77.5 with a standard deviation of 8.1.

#### Results 
  We will use a conjugate normal prior with mu of 75 and sigma of 10, given by the test parameters.  Using monte carlo sampling the probability that study method A is worse than B given the data.  kappa knot and nu knot are sample size for each respective group.  As sample size increases (your prior strength increases) we become less certain that group A method is superior to group B method.
