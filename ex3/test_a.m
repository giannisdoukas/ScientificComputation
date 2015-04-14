clc
n=20;
% matrix with condition number 10^4
fprintf('+---------------------------------------+\n');
fprintf(' Matrix with condition number 10^4 \n');
condNum = 10^4;
A = newMatrix(n,condNum);
x = ones(n,1);
b = A*x;
x_dgesv = dgesv(A,b);
x_dgesvx = dgesvx(A,b);
fprintf('\t');
forward_error_dgesv = norm(x_dgesv - x, inf)/norm(x, inf)
forward_error_dgesvx = norm(x_dgesvx - x, inf)/norm(x, inf)
x_mldivide = A\b;
forward_error_mldivide = norm(x_mldivide - x, inf)/norm(x, inf)

fprintf('+---------------------------------------+\n');
fprintf(' Matrx with condition number 10^10');
condNum = 10^10;
A = newMatrix(n,condNum);
x = ones(n,1);
b = A*x;
x_dgesv = dgesv(A,b);
x_dgesvx = dgesvx(A,b);
forward_error_dgesv = norm(x_dgesv - x, inf)/norm(x, inf)
forward_error_dgesvx = norm(x_dgesvx - x, inf)/norm(x, inf)
x_mldivide = A\b;
forward_error_mldivide = norm(x_mldivide - x, inf)/norm(x, inf)

fprintf('+---------------------------------------+\n');
fprintf(' Random Lower trangular\n');
A = tril ( rand(n) );
x = ones(n,1);
b = A*x;
x_dgesv = dgesv(A,b);
x_dgesvx = dgesvx(A,b);
forward_error_dgesv = norm(x_dgesv - x, inf)/norm(x, inf)
forward_error_dgesvx = norm(x_dgesvx - x, inf)/norm(x, inf)
x_mldivide = A\b;
forward_error_mldivide = norm(x_mldivide - x, inf)/norm(x, inf)

fprintf('+---------------------------------------+\n');
fprintf(' GFPP Matrx \n');
A = triu ( rand(n-1) );
A = gfpp(A);
x = ones(n,1);
b = A*x;
x_dgesv = dgesv(A,b);
x_dgesvx = dgesvx(A,b);
forward_error_dgesv = norm(x_dgesv - x, inf)/norm(x, inf)
forward_error_dgesvx = norm(x_dgesvx - x, inf)/norm(x, inf)
x_mldivide = A\b;
forward_error_mldivide = norm(x_mldivide - x, inf)/norm(x, inf)