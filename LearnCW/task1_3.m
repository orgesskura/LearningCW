%
% Versin 0.9  (HS 06/03/2020)
%
function task1_3(Cov)
% Input:
%  Cov : D-by-D covariance matrix (double)
% Variales to save:
%  EVecs : D-by-D matrix of column vectors of eigen vectors (double)  
%  EVals : D-by-1 vector of eigen values (double)  
%  Cumvar : D-by-1 vector of cumulative variance (double)  
%  MinDims : 4-by-1 vector (int32)  
  [EVecs,EVals] = eig(Cov);
  EVals = diag(EVals);
  [tmp,ridx] = sort(EVals,"descend");
  EVals = EVals(ridx);
  EVecs = EVecs(:,ridx);
  Cumvar = cumsum(EVals);
  D = length(Cumvar);
  sum = Cumvar(D);
  MinDims = zeros(4,1);
  s = 1;
  idx=0;
  for i=1:D
      div = Cumvar(i)/sum;
      if div>=0.7
          MinDims(s) = i;
          s = s +1;
          idx = i;
          break
      end
  end
  for i=idx:D
      div = Cumvar(i)/sum;
      if div>=0.8
          MinDims(s) = i;
          s = s +1;
          idx = i;
          break
      end
  end
  for i=idx:D
      div = Cumvar(i)/sum;
      if div>=0.9
          MinDims(s) = i;
          s = s +1;
          idx = i;
          break
      end
  end
  for i=idx:D
      div = Cumvar(i)/sum;
      if div>=0.95
          MinDims(s) = i;
          break
      end
  end
  for i=1:D
      if EVecs(1,i) < 0 
          EVecs(:,i) = -1 * EVecs(:,i);
      end
  end
  save('t1_EVecs.mat', 'EVecs');
  save('t1_EVals.mat', 'EVals');
  save('t1_Cumvar.mat', 'Cumvar');
  save('t1_MinDims.mat', 'MinDims');
end
