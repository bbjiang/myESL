# myESL
My slides and MATLAB codes in 2014 summer reading: the Elements of Statistical Learning. This repository is migrated from [my Purdue GitHub account](https://github.rcac.purdue.edu/bjiang). And I will keep updating my practice notes on ESL here.

## Chapter 8: Model Inference and Averaging

### 8.5 The EM Algorithm
I implemented the Algorithm 8.1, EM Algorithm for Two-component Gaussian Mixture, in Matlab/R2012b. Simply execute `/Chap8/mcodes/EM.m`, and you will see two figures:
* Figure 1, the histogram of data of the mixture example (see also Figure 8.5 in ESL book);
* Figure 2, EM learning curve (see also Figure 8.6 in ESL book).

### 8.6 MCMC for Sampling from the Posterior
Execute `/Chap8/mcodes/Gibbs.m`, and you will see the histogram as shown in the EM section, and the figure as shown in Figure 8.8 in ESL book.

### Exercise 8.6 Bone mineral density data
Find the code `/Chap8/mcodes/Ex86.m`, and it fits the data using (a) cubic smooth spline, (b) Bayesian methods, and (c) bootstrap.


## Chapter 17: Undirected Graphical Models

### 17.3.1 Modified Regression for UGM with Known Structure
See `/Chap17/mcodes/Call171.m` for my implementation of Algorithm 17.1.

### 17.3.2 Graphical Lasso
See `/Chap17/mcodes/Call172.m` for my implementation of Algorithm 17.2.
