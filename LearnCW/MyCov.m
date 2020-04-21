function Cov = MyCov(X)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n1 = length(X(1,:));
n = length(X(:,1));
x_mean = zeros(n1,1);
for i=1:n
      x_mean = x_mean + X(i,:)';
end
x_mean = 1/n * x_mean;
Cov = zeros(n1,n1);
for i=1:n
  s = X(i,:)' - x_mean;
  Cov = Cov + s * s';
end
Cov =1/n* Cov;

end

