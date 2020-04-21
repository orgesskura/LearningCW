function Corr = MyCorr(S)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = length(S);
Corr = zeros(n,n);
for i=1:n
    for j=1:n
        Corr(i,j) = S(i,j)/(sqrt(S(i,i)*S(j,j)));
    end
end
        

end

