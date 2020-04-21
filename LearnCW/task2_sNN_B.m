function [Y] = task2_sNN_B(X)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
W1 = [-1.0000 1.0000 1.0000 1.0000;
       0.620479 -0.265378 -0.072651 0.119266 ;
       0.530635 0.233003 -0.290794  -0.473036 ];
   
%declare second layer weight matrix
W2 = [-30.0000  -30.0000 -30.0000 -30.0000;
       20.0000  20.0000  0.0000  20.0000;
       20.0000  0.0000  20.0000 0.0000;
       0.0000   20.0000  0.0000 0.0000;
       0.0000   0.0000  20.0000 20.0000];
  
%declare third layer weight matrix
W3 = [-30.0000 -30.0000;
       20.0000 0.0000;
       20.0000 0.0000;
       0.0000  20.0000;
       0.0000  20.0000];
%declare fourth layer weight matrix
W4 = [-1.0000;
      2.0000;
      2.0000];
[a,cols1] = size(W1);
[a,cols2] = size(W2);
[a,cols3] = size(W3);
%let N be number of inputs in matrix X
N = length(X(:,1));

%let y1 be output after first layer
Y1 = zeros(N,cols1);
%let y2 be output after second layer
Y2 = zeros(N,cols2);
%let Y3 be output after third layer
Y3 = zeros(N,cols3);
%let Y be final output
Y = zeros(N,1);

%multiply weights by a big number to get overflow to 0 or 1
W1 = 100000000 * W1;
%calculate output after first layer
for i=1:cols1
    Y1(:,i) = task2_sNeuron(W1(:,i),X);
end    
%calculate output after second layer using Y1 as input instead of X
for i=1:cols2
    Y2(:,i) = task2_sNeuron(W2(:,i),Y1);
end

%calculate final output after the third layer using Y2 as an input
for i=1:cols3
 Y3(:,i) = task2_sNeuron(W3(:,i),Y2);
end

%calculate final output using Y3 as input
Y = task2_sNeuron(W4,Y3);

end

