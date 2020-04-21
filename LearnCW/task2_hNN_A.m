%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNN_A(X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
% Output:
%  Y : N-by-1 vector of output (double)

%For this task i will use the weight matrix values calculated before on
%task 2.3

%declare first layer weight matrix
W1 = [-1.0000 1.0000 1.0000 -1.0000;
       0.264526 -0.469566 -0.215142 0.987442;
       0.252046  0.483937  -0.201529 -0.892448];
   
%declare second layer weight matrix
W2 = [-1.0000 -1.0000;
       0.6667  0.0000;
       0.6667  0.0000;
       0.0000  0.6667;
       0.0000  0.6667];
  
%declare third layer weight matrix
W3 = [-1.0000;
       0.6667;
       0.6667];
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
%calculate output after first layer
for i=1:cols1
    Y1(:,i) = task2_hNeuron(W1(:,i),X);
end    
%calculate output after second layer using Y1 as input instead of X
for i=1:cols2
    Y2(:,i) = task2_hNeuron(W2(:,i),Y1);
end

%calculate final output after the third layer using Y2 as an input

Y = task2_hNeuron(W3,Y2);
 
       


end
