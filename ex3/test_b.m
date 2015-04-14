clc
n=512;

maxit = n;
tol = 10^(-8);
% create matrix (a)
fprintf('------------- Matrix (a) -------------\n');
x = ones(n,1);
Q = orth(rand(n));
L = diag( [0.7*ones(1,n/4), 1.2*ones(1,n/4), 2*ones(1,n/2)] );
A = hess( Q'* L * Q );
A = sparse(A);
b = A*x;
% solve Ax=b
fprintf('------------- Solve (a) -------------\n');
[x_j_a, error, iter_j_a] = jacobi(A, zeros(n,1), b, maxit, tol);
[x_cg_a, w, q, iter_cg_a ] = pcg(A, b, tol, maxit );
x_ml = A \ b;
f = @() jacobi(A, zeros(n,1), b, maxit, tol);
t_jac_a = timeit(f);
f = @() pcg(A, b, tol, maxit );
t_cg_a = timeit(f);
% sfalmata_a
fprintf('------------- Sfalmata (a) -------------\n');
figure
hold on
xlabel('sfalma');
ylabel('epanalipseis');
title('a erwtima');
% sxetika kataloipa
fprintf('------------- Sxetika kataloipa (a) -------------\n');
kat_j_a = norm(b - A*x_j_a ,2) / norm(b ,2)
plot(kat_j_a, iter_j_a, 'm*' );
kat_cg_a = norm(b - A*x_cg_a ,2) / norm(b ,2)
plot(kat_cg_a, iter_cg_a, 'g*' );
% sxetiko empros sfalma
fprintf('------------- Sxetiko embros sfalma (a) -------------\n');
sxe_j_a = norm(x_ml - x_j_a ,inf) / norm(x_ml ,inf)
plot(sxe_j_a, iter_j_a, 'c*' );
sxe_cg_a = norm(x_ml - x_cg_a ,inf) / norm(x_ml ,inf)
plot(sxe_cg_a, iter_cg_a, 'b*' );
% oliko sxetiko sfalma
fprintf('------------- Oliko sxetiko sfalma (a) -------------\n');
osx_j_a = norm(x - x_j_a ,inf) / norm(x ,inf)
plot(osx_j_a, iter_j_a, 'k*' );
osx_cg_a = norm(x - x_cg_a ,inf) / norm(x ,inf)
plot(osx_cg_a, iter_cg_a, 'r*' );
legend('sxetiko kataloipo Jacobi (a)', 'sxetiko kataloipo CG (a)', ...
    'empros sxetiko sfalma Jacobi (a)', 'empros sxetiko sfalma CG (a)', ...
    'oliko sxetiko sfalma Jacobi (a)', 'oliko sxetiko sfalma CG (a)');
hold off

figure
hold on
xlabel('sfalma');
ylabel('epanalipseis');
title('b erwtima');
fprintf('------------- Matrix (b) -------------\n');
% create matrix (b)
x_max = pi/6;
x_min = 0;
% u read solution
u = zeros(n,1);
for j=1:n
    u(j) = exp(j) * sin(3*j);
end
% solve AU=F
fprintf('------------- Solve (b) -------------\n');
A = dif_A(n, x_max, x_min);
F = dif_F(n, x_max, x_min);
[x_j_b, error, iter_j_b] = jacobi(A, zeros(n,1), F, maxit, tol);
[x_cg_b, w, q, iter_cg_b ] = pcg(A, F, tol, maxit );
U = A\F;
fprintf('------------- Sfalmata (b) -------------\n');
% sxetika kataloipa
fprintf('------------- Sxetika kataloipa (b) -------------\n');
kat_j_b = norm(F - A*x_j_b ,2) / norm(F ,2)
plot(kat_j_b, iter_j_b, 'm*' );
kat_cg_b = norm(F - A*x_cg_b ,2) / norm(F ,2)
plot(kat_cg_b, iter_cg_b, 'g*' );
% sxetiko empros sfalma
fprintf('------------- Sxetiko embros sfalma (b) -------------\n');
sxe_j_b = norm(U - x_j_b ,inf) / norm(U ,inf)
plot(sxe_j_b, iter_j_b, 'c*' );
sxe_cg_b = norm(U - x_cg_b ,inf) / norm(U ,inf)
plot(sxe_cg_b, iter_cg_b, 'b*' );
% oliko sxetiko sfalma
fprintf('------------- Oliko sxetiko sfalma (b) -------------\n');
osx_j_b = norm(u - x_j_b ,inf) / norm(u ,inf)
plot(osx_j_b, iter_j_b, 'k*' );
osx_cg_b = norm(u - x_cg_b ,inf) / norm(u ,inf)
plot(osx_cg_b, iter_cg_b, 'r*' );

f = @() jacobi(A, zeros(n,1), F, maxit, tol);
t_jac_b = timeit(f);
f = @() pcg(A, F, tol, maxit );
t_cg_b = timeit(f);

legend('sxetiko kataloipo Jacobi (b)', 'sxetiko kataloipo CG (b)', ...
    'empros sxetiko sfalma Jacobi (b)', 'empros sxetiko sfalma CG (b)', ...
    'oliko sxetiko sfalma Jacobi (b)', 'oliko sxetiko sfalma CG (b)', ...
    'Location', 'best');
hold off

figure
hold on
xlabel('xronos ektelesis');
ylabel('epanalipseis');
title('xronometrisi');
plot(t_jac_a, iter_j_a, 'r*');
plot(t_jac_b, iter_j_b, 'c*');
plot(t_cg_a, iter_cg_a, 'k*');
plot(t_cg_b, iter_cg_b, 'b*');
legend('xronos Jacobi (a)', 'xronos Jacobi (b)', 'xronos CG (a)', 'xronos CG (b)', 'Location', 'best');
hold off