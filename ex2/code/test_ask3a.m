clc
n = 512;

fprintf('eps = ');
disp(eps);

% random matrix A
fprintf('\n------------- random matrix A -------------\n');
A = randn(n);
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);

% lower triangular matrix
fprintf('\n--------- lower triangular matrix ---------\n');
A = tril( randn(n) );
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);
% lu
fprintf('\n------------------- lu --------------------\n');
[ans,A] = lu( randn(n) );
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);

% gfpp
fprintf('\n------------------ gfpp -------------------\n');
temp = triu( randn(n-1) );
A = gfpp(temp);
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);

% vardermonde [-1,1]
fprintf('\n----------- vardermonde [-1,1] ------------\n');
A = vander( linspace(-1,1,n) );
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);

% vardermonde cos(k\pi/(n+1) ,k=0:n)
fprintf('\n------- vardermonde cos(k*pi/(n+1) --------\n');
k = 0:n;
A = vander( cos(k*pi/(n+1)) );
[cn, e_sx_sf, b_sf, b_c, db_b, f_prog_x] = ask3a(A);
fprintf('condition number            :');
disp(cn);
fprintf('forward error               :');
disp(e_sx_sf);
fprintf('backward error (norm inf)   :');
disp(b_sf);
fprintf('backward error (norm inf,1) :');
disp(b_c);
bound1 = cn*b_sf;
bound2 = cn*b_c;
fprintf('bound1: %d <= %d \n', e_sx_sf, bound1);
fprintf('bound2: %d <= %d \n', e_sx_sf, bound2);
fprintf('bound3: %d <= %d \n', e_sx_sf, db_b);