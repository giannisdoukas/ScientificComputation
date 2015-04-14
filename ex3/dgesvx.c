/*=========================================================*
 * compile with mex -v -g -largeArrayDims dgesvx.c -llapack *
 *=========================================================*/
#include "mex.h"
#include "lapack.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	size_t n;
	int ione, info;
	char equed = 'N';
	char fact = 'N'; 
	char transa = 'N';
	int *ipiv, *iwork;
	double *r, *c, *X, *work, *af;
	double rcond, ferr, berr;
	int dim;
	double rcondition,forwarderror,berror;

	size_t m, bnrhs, lda, ldb;
    double *A,*b, *A2, *b2, *ret;
	int i;
	
	m = mxGetM(prhs[0]);
    n = mxGetN(prhs[0]); 
    bnrhs = mxGetN(prhs[1]);

	dim = n;
	ione = 1;
	af = (double *) mxCalloc( dim*dim , sizeof( double ) );
	r = (double *) mxCalloc( dim , sizeof( double ) );
	c = (double *) mxCalloc( dim , sizeof( double ) );
	X = (double *) mxCalloc( dim , sizeof( double ) );
	work = (double *) mxCalloc( 4* dim , sizeof( double ) );
	ipiv = (int *) mxCalloc( dim , sizeof( int ) );
	iwork = (int *) mxCalloc( dim , sizeof( int ) );

	A = mxGetPr(prhs[0]); 
    b = mxGetPr(prhs[1]); 
    
	A2 = (double *)mxCalloc(m*n,sizeof(double));
    b2 = (double *)mxCalloc(m*bnrhs,sizeof(double));
	
    for(i=0;i<m*bnrhs;i++) 
    {
        b2[i] = b[i];
    }
    
    for(i=0;i<m*n;i++)   A2[i] = A[i];
    
    lda = m;
    ldb = m;
	dgesvx( &fact, &transa, &n, &ione, A2, &lda, af, &n, ipiv, &equed, r, c, b2, &ldb, X, &n, &rcond, &ferr, &berr, work, iwork, &info );

	printf("Condition = %.20f\n",rcond );
	printf("Backward error = %.20f\n",berr );
	printf("Forward error = %.20f\n",ferr );
    printf("Sintelestis afksisis = %.20f\n",work[1]);
    
    plhs[0] = mxCreateDoubleMatrix(m,bnrhs,mxREAL);
	
	ret = mxGetPr(plhs[0]);
    
    for(i=0;i<m*bnrhs;i++) 
    {
       ret[i] = X[i];
    }

    mxFree(af); 
	mxFree(r);
	mxFree(c); 
	mxFree(X);
	mxFree(work);
	mxFree(ipiv); 
	mxFree(iwork);
}
