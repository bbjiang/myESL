% Call Algorithm 17.1: Modified Regression
clear
clc

S = [10 1 5 4;
    1 10 2 6;
    5 2 10 3;
    4 6 3 10];

T = [0 0 1 0;
    0 0 0 1;
    1 0 0 0;
    0 1 0 0];

disp('The following results are on Page 634:')
[W, Q] = ModReg171(S,T)