n = 1024;

fprintf('---------- Random matrix ----------\n');
ask3b(rand(n,n), rand(n,n));

fprintf('------- Vandremonde matrix --------\n');
ask3b(vander( rand(n,1) ), vander( rand(n,1) ) );

fprintf('------- telefteo matrix --------\n');
n = 512;
M = 10^7;
A = [eye(n), zeros(n); zeros(n), eye(n)] * [M*rand(n), rand(n); rand(n), rand(n)];
B = [eye(n), zeros(n); zeros(n), eye(n)] * [M*rand(n), rand(n); rand(n), rand(n)];
ask3b(A,B);
