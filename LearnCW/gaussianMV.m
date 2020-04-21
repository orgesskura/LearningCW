function p = gaussianMV(mu,covar,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   [d, b] = size(covar);

   if (d~=b)
    error("Covariance matrix should be square");
   end
   mu = reshape(mu, d, 1);
   x = reshape(x, d, 1);
   p = 1/sqrt((2*pi)^d*det(covar))*exp(-0.5*(x-mu)'*inv(covar)*(x-mu));

end