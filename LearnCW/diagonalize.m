function C = diagonalize(X)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
C = zeros(length(X),length(X));
for i=1:length(X(:,1))
    for j = 1:length(X(1,:))
        if i==j
           C(i,j) = C(i,j) + X(i,j);
        end
    end
end
            
            
end

