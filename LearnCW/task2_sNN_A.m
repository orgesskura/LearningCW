function [Y] = task2_sNN_A(X)

% Input:
%  X : N-by-D matrix of input vectors (double)
% Output:
%  Y : N-by-1 vector of output (double)

W1 = [-1.0000 1.0000 1.0000 -1.0000;
       0.264526 -0.469566 -0.215142 0.987442;
       0.252046  0.483937  -0.201529 -0.892448];
   
%declare second layer weight matrix
W2 = [-30.000 -30.0000;
       20.0000  0.0000;
       20.0000 0.0000;
       0.0000  20.000;
       0.0000  20.000];
  
%declare third layer weight matrix
W3 = [-30.0000;
       20.0000;
       20.0000];
[a,cols1] = size(W1);
[a,cols2] = size(W2);

%let N be number of inputs in matrix X
N = length(X(:,1));

%let y1 be output after first layer
Y1 = zeros(N,cols1);
%let y2 be output after second layer
Y2 = zeros(N,cols2);
%let Y be final output
Y = zeros(N,1);
W1 = 100000000*W1;
%calculate output after first layer
for i=1:cols1
    Y1(:,i) = task2_sNeuron(W1(:,i),X);
end    
%calculate output after second layer using Y1 as input instead of X
for i=1:cols2
    Y2(:,i) = task2_sNeuron(W2(:,i),Y1);
end

%calculate final output after the third layer using Y2 as an input

Y = task2_sNeuron(W3,Y2);

end

