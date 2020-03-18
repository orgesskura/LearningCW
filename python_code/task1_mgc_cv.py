#
# Version 0.9  (HS 09/03/2020)
#
import numpy as np
import scipy.io

def task1_mgc_cv(X, Y, CovKind, epsilon, Kfolds):
    # Input:
    #  X : N-by-D matrix of feature vectors (np.double)
    #  Y : N-by-1 label vector (np.int32)
    #  CovKind : scalar (np.int32)
    #  epsilon : scalar (np.double)
    #  Kfolds  : scalar (np.int32)
    #
    # Variables to save
    #  PMap   : N-by-1 vector of partition numbers (np.int32)
    #  Ms     : C-by-D matrix of mean vectors (np.double)
    #  Covs   : C-by-D-by-D array of covariance matrices (np.double)
    #  CM     : C-by-C confusion matrix (np.double)
    
    # scipy.io.savemat('t1_mgc_<Kfolds>cv_PMap.mat', mdict={'PMap':PMap})
    # For each <p> and <CovKind>
    #  scipy.io.savemat('t1_mgc_<Kfolds>cv<p>_Ms.mat', mdic={'Ms':Ms})
    #  scipy.io.savemat('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_Covs.mat', mdict={'Covs': Cov})
    #  scipy.io.savemat('t1_mgc_<Kfolds>cv<p>_ck<CovKind>_CM.mat', mdict={'CM':CM});
    #  scipy.io.savemat('t1_mgc_<Kfolds>cv<L>_ck<CovKind>_CM.mat', mdict={'CM':CM});
    # NB: replace <Kfolds>, <p>, and <CovKind> properly.

    

