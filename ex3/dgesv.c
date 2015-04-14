/*=========================================================*
 * compile with mex -v -g -largeArrayDims dgesv.c -llapack *
 *=========================================================*/
#include "mex.h"

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] )
{

	/* mex interface to LAPACK functions dsysvx and zhesvx */

    int m, n, bnrhs, lda, *ipiv, ldb, info;
    double *A,*b, *AT, *bT, *ret;
	int i;
	
    if (nrhs != 2) {
      mexErrMsgTxt("Expect 2 input arguments and return 1 output argument");
    }

    A = mxGetPr(prhs[0]);
    b = mxGetPr(prhs[1]);
    m = mxGetM(prhs[0]);
    n = mxGetN(prhs[0]); 
    bnrhs = mxGetN(prhs[1]);
    
    AT = (double *)mxCalloc(m*n,sizeof(double));
    bT = (double *)mxCalloc(m*bnrhs,sizeof(double));
    ipiv = (int *)mxCalloc(m,sizeof(int));
    
    for(i=0;i<m*bnrhs;i++) {
        bT[i] = b[i];
    }
    
    for(i=0;i<m*n;i++) AT[i] = A[i];
    lda = m;
    ldb = m;
    dgesv(&m, &bnrhs, AT, &lda, ipiv, bT, &ldb, &info);      
    
    plhs[0] = mxCreateDoubleMatrix(m,bnrhs,mxREAL);
    ret = mxGetPr(plhs[0]);
    for(i=0;i<m*bnrhs;i++) ret[i] = bT[i];
    
    mxFree(AT);
    mxFree(bT);
    mxFree(ipiv);
}
