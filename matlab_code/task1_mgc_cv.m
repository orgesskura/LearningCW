%
% Versin 0.9  (HS 06/03/2020)
%
function task1_mgc_cv(X, Y, CovKind, epsilon, Kfolds)
% Input:
%  X : N-by-D matrix of feature vectors (double)
%  Y : N-by-1 label vector (int32)
%  CovKind : scalar (int32)
%  epsilon : scalar (double)
%  Kfolds  : scalar (int32)
%
% Variables to save
%  PMap   : N-by-1 vector of partition numbers (int32)
%  Ms     : C-by-D matrix of mean vectors (double)
%  Covs   : C-by-D-by-D array of covariance matrices (double)
%  CM     : C-by-C confusion matrix (double)


  % save('t1_mgc_<Kfolds>cv_PMap.mat', 'PMap');
  % For each <p> and <CovKind>
  %  save('t1_mgc_<Kfolds>cv<p>_Ms.mat', 'Ms');
  %  save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_Covs.mat', 'Covs');
  %  save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_CM.mat', 'CM');
  %  save('t1_mgc_<Kfolds>cv<L>_ck<CovKind>_CM.mat', 'CM');
  % NB: replace <Kfolds>, <p>, and <CovKind> properly.

end
