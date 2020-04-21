%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_AB(X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)

%the function task2_hNN_B classifies the inner of polygon B as 1 and
%outside as 0(including the periphery
Y1 = task2_hNN_B(X);
N = length(X(:,1));
%in task 2.4 we classify the inner as 1 andd outside as 0. We use that and
%then we negate the results to get the opposite
Y2 = task2_hNN_A(X);
%W1 is the weight matrix to negate the results from Y2
W1 = [1.0000;
      -2.0000];
Y2 = task2_hNeuron(W1,Y2);
      
%We need to and the results from Y1 and Y2
%We have calculated the weight matrix for that before
W = [-1.0000;
       0.6667;
       0.6667];
%declare matrix Y3 having Y1 as first column and Y2 as second column
Y3 = zeros(N,2);
Y3(:,1) = Y1;
Y3(:,2) = Y2;
Y = zeros(N,1);
Y = task2_hNeuron(W,Y3);
end
