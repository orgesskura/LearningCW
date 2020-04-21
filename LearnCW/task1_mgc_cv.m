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


   
  % For each <p> and <CovKind>
   
  %  save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_Covs.mat', 'Covs');
  %  save('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_CM.mat', 'CM');
  %  save('t1_mgc_<Kfolds>cv<L>_ck<CovKind>_CM.mat', 'CM');
  % NB: replace <Kfolds>, <p>, and <CovKind> properly.


%store number of classes in var K
K = max(Y);
%store number of features in var D
D = length(X(1,:));
%store number of samples in var N
N = length(X(:,1));
%create vector PMap
PMap = zeros(N,1);
%create an array containing how many samples each class has
arr_nr = zeros(K,1);
for i=1:K
    samp = 0;
    for j=1:N
        if Y(j) == i
            samp = samp + 1;
        end
    end
    arr_nr(i) = samp;
end
%divide each class into a  partition by using the k cross validation from
%the paper..done in 3 for loops

for i=1:K
    Mc = floor( double(arr_nr(i)) / double(Kfolds) );
    s = 1 ;
    for j=1:Kfolds
        limit = Mc;
        if j == Kfolds
            limit = arr_nr(i) - Mc*(Kfolds -1);
        end
        for k = s : N
           if limit == 0
               s=k;
               break
               
           end
           
           if Y(k) == i
               limit = limit - 1;
               PMap(k) = j;
           end
           
        end
    end
end
s = "t1_mgc_" + string(Kfolds) +"cv_PMap.mat";

save(s, 'PMap');

% go through each partition
CM1 = zeros(K,K);
for p = 1:Kfolds
    %first create a vector counting how many samples of each class are not
    %in the current partition
    vec = zeros(K,1);
    %create matrix of mean vectors
    Ms = zeros(K,D);
    %calculate vec and also add to Ms to calculate mean
    for i=1:N
        if PMap(i) ~=p
            vec(Y(i),1) = vec(Y(i),1) + 1;
            Ms(Y(i),:) = Ms(Y(i),:) + X(i,:);
        end
    end
    %divide each class by number of elements to get mean
    for i=1:K
        Ms(i,:) = 1/vec(i,1) * Ms(i,:);
    end
    s = "t1_mgc_" + string(Kfolds) + "cv" + string(p) +"_Ms.mat";
    save(s, 'Ms');
    %save the 3d covariance matrix in Covs
    Covs = zeros(K,D,D);
    %go through the data to construct the covariance matrix
    for i=1:N
        if PMap(i) ~= p
            var = X(i,:)- Ms(Y(i));
            Covs(Y(i),:,:) = reshape(Covs(Y(i),:,:), D, D) + var' * var;
        end
    end
    %go through each class to normalize the covariance
    for i=1:K
        Covs(i,:,:) = reshape(Covs(i,:,:), D, D)* 1/vec(i,1);
    end
    %calculate covariance matrix if it is diagonal or shared,also we need
    %to regularize it
    if CovKind == 2
        for i=1:K
            %diagonalize function take a matrix and returns a diagonalized
            %version of that matrix
            Cov1 = diagonalize(reshape(Covs(i,:,:),D,D));
            Covs(i,:,:) = Cov1 + epsilon * eye(D,D);
        end
    
    elseif CovKind == 3
        Cov = zeros(D,D);
        for i=1:K
            Cov = Cov + reshape(Covs(i,:,:), D, D);
        end
        Cov = 1/double(K) * Cov;
        Cov = Cov + epsilon * eye(D,D);
        %store cov in every covar since it is shared
        for i=1:K
            Covs(i,:,:) = Cov;
        end
    
    %regularize if we have full covariance
    else
    for i=1:K
     Covs(i,:,:) = reshape(Covs(i,:,:), D, D) + epsilon * eye(D,D);
    end
    end
    s = "t1_mgc_" + string(Kfolds)+"cv" + string(p) +"_ck"+string(CovKind)+"_Covs.mat";
    save(s, 'Covs');
    
    %calculate prior likelihoods;vec holds the proportions of the training
    %data
    %calculate prior likelihood vector\
    priorLik = zeros(K,1);
    for i=1:K
        priorLik(i,1) = priorLik(i,1) + vec(i) / sum(vec);
    end
    %lets calculate posterior probabilities
    %First let's find the number of test data;vecholds number of training
    %data from each class
    T = N - sum(vec);
    %create a matrix holding the posterior probabilites of each tests point
    %in regards to each class K
    test = zeros(T,K);
    %the pdf function i have used is the  same one used from the labs
    % I use the normal distribution here
    s = 1;
    for i = 1:N
      if PMap(i) ~= p
          continue;
      end
      for j=1:K 
        %compute likelihood of each class
        lik = gaussianMV(Ms(j,:), reshape(Covs(j,:,:),D,D), X(i,:));
        %compute joint probability of each class
        test(s,j) = test(s,j) + double(priorLik(j,1)) * double(lik);
      end
      s = s+1;
    end
    % find the biggest prob in each row and assign the values and ordering
    % to max_out and test_res respectively
    [maxout,test_res] = max(test,[],2);
    
    %test_res tells us which class each point belongs to according to the
    %classifier
    %lets create the confusion matrix
    CM = zeros(K,K);
    s=1;
    for i=1:N
        if PMap(i) == p
            CM(Y(i),test_res(s)) = CM(Y(i),test_res(s)) + 1;
            s = s +1;
        end
    end
    CM1 = CM1 +CM;
    s = "t1_mgc_" + string(Kfolds)+"cv" + string(p) + "_ck" + string(CovKind) + "_CM.mat";
    save(s, 'CM');
        
end
CM = 1/N * CM1;
s = "t1_mgc_" + string(Kfolds)+"cv" + string(Kfolds+1) + "_ck" + string(CovKind) + "_CM.mat";
save(s, 'CM');
end
