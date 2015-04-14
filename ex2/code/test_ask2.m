format LONGG
x = single( zeros(64,1) );

% i 
fprintf('\n\n----------- taylor ------------ \n\n');
for i=0:63,
    x(i+1) = ( -2*pi )^i /  factorial(i);
end
ask2

x = single( zeros(4096,1) );
% ii
fprintf('\n\n-------- 1, 10e-18, -1 -------- \n\n');
x(1:2047) = single( ones(2047,1) );
x(2048:2049) = single( 1e-18 );
x(2050:4096) = single( -1 );
ask2

% iii
fprintf('\n\n------------ [1,2] ------------ \n\n');
x = single( linspace(1,2,4096) );
ask2

% iv
fprintf('\n\n----------- 1/(i^2) ----------- \n\n');
for i=1:4096,
    x(i) = single( 1/(i^2) );
end
ask2
format short