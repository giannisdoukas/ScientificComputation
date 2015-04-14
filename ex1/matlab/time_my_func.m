p = 5;
n=2.^[8:11]';
t = zeros(length(n),1);
t_col = zeros(length(n),1);
for i=1:length(n)
    
    u = rand(n(i),1);
    v = rand(n(i),1);
    col = randi(n(i));
    
    f = @() my_func(p,u,v);
    t(i) = timeit(f,1)
    
    f = @() my_func(p,u,v,col);
    t_col(i) = timeit(f,1)
end

h=figure
subplot(2,1,1);
loglog(n,t,'b*-',n,t_col,'ro-');
xlabel(' log matrix size ');
ylabel(' log time (sec)');
legend('Calculate full matrix', 'Calculate only a column of matrix', 'Location','best');
title('Time of my_func');

mips = ( 2*(p-1).*n.^3+(p+1).*n.^2 ) ./ t;
mips_col = ( 4*p.*n.^2 - p.*n ) ./ t_col;
subplot(2,1,2);
loglog(n,mips,'b*-',n,mips_col,'ro-');
xlabel(' log matrix size ');
ylabel(' log time (sec)');
legend('Calculate full matrix', 'Calculate only a column of matrix', 'Location','best');
title('Mflops of my_func');

saveas(h,'ask4_4_a','png')