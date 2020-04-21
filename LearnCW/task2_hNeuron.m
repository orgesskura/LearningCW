%
% Versin 0.9  (HS 06/03/2020)
%
function [Y] = task2_hNeuron(W, X)
% Input:
%  X : N-by-D matrix of input vectors (in row-wise) (double)
%  W : (D+1)-by-1 vector of weights (double)
% Output:
%  Y : N-by-1 vector of output (double)
   N = length(X(:,1));
   D = length(X(1,:));
   X1 = zeros(N,D+1);
   for i=1:N
       X1(i,1) = 1.0000;
   end
   
   for j =2:D+1
      X1(:,j) = X(:,j-1);
   end
   
   Y = W' * X1';
   Y = Y';
   for i=1:length(Y)
       if Y(i,1) >0
           Y(i) = 1.0000;
       else
           Y(i,1) = 0.0000;
       end
   end

end
