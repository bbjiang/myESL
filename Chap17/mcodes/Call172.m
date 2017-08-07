% Call Algorithm 17.2: Graph Lasso
clear;
clc;
pronames = textread('./pronames.txt','%s');
S = textread('./cov.txt')

subplot(2,2,1);
[W, Q] = GraphLasso(S,36);
plot175(Q);
subplot(2,2,2);
[W, Q] = GraphLasso(S,27);
plot175(Q);
subplot(2,2,3);
[W, Q] = GraphLasso(S,7);
plot175(Q);
subplot(2,2,4);
[W, Q] = GraphLasso(S,0);
plot175(Q);