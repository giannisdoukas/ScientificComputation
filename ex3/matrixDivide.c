#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    // mexPrintf("nlhs: %d \n", nlhs);
    // mexPrintf("------------------------\n");
    // for (int i = 0; i < nlhs; i++)
    // {
    // 	mexPrintf("plhs[%d]: %f \n",i, *(mxGetPr(plhs[i])) );
    // }

    // mexPrintf("nrhs: %d \n", nrhs);
    // mexPrintf("------------------------\n");
    // for (int i = 0; i < nrhs; i++)
    // {
    // 	mexPrintf("prhs[%d]: %f \n",i, *(mxGetPr(prhs[i])) );
    // }

    // int n = nlhs, lda = nlhs, ldb = nlhs, info;
    //     /* Local arrays */
    //     int ipiv[N];
    //     double a[LDA*N] = {
    //         6.80, -2.11,  5.66,  5.97,  8.23,
    //        -6.05, -3.30,  5.36, -4.44,  1.08,
    //        -0.45,  2.58, -2.70,  0.27,  9.04,
    //         8.32,  2.71,  4.35, -7.17,  2.14,
    //        -9.67, -5.14, -7.26,  6.08, -6.87
    //     };
    //     double b[LDB*NRHS] = {
    //         4.02,  6.19, -8.22, -7.57, -3.03,
    //        -1.56,  4.00, -8.67,  1.75,  2.86,
    //         9.81, -4.09, -4.57, -8.61,  8.99
    //     };
    //     /* Executable statements */
    //     printf( " DGESV Example Program Results\n" );
    //     /* Solve the equations A*X = B */
    //     dgesv( &n, &nrhs, a, &lda, ipiv, b, &ldb, &info );

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
    mexPrintf("\n");

    for(i=0;i<m*n;i++) AT[i] = A[i];
    lda = m;
    ldb = m;

    dgesv(&m, &bnrhs, AT, &lda, ipiv, bT, &ldb, &info);      
}