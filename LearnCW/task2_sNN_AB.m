%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_sNN_AB(X)
% Input:
%  X : N-by-D matrix of input vectors (double)
% Output:
%  Y : N-by-1 vector of output (double)

%in task2_sNN_A i take the inner of A as 1 and outer of A as 0 using the
%sigmoid function
Y1 = task2_sNN_B(X);
N = length(X(:,1));
%in task 2.4 we classify the inner as 1 andd outside as 0. We use that and
%then we negate the results to get the opposite
Y2 = task2_sNN_A(X);
%W1 is the weight matrix to negate the results from Y2
W1 = [1000.0000;
      -1000.0000];
Y2 = task2_sNeuron(W1,Y2);
      
%We need to and the results from Y1 and Y2
%We have calculated the weight matrix for that before
W = [-30.0000;
      20.0000;
      20.0000];
%declare matrix Y3 having Y1 as first column and Y2 as second column
Y3 = zeros(N,2);
Y3(:,1) = Y1;
Y3(:,2) = Y2;
Y = zeros(N,1);
Y = task2_sNeuron(W,Y3);      


end

