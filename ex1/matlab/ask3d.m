n = 2.^[7:10];
teye = zeros( length(n) ,1);
tsq = zeros( length(n) ,1);
for i=1:length(n)
    I = eye(n(i),n(i));
    A = rand(n(i),n(i));
    
    f = @() mtimes(A, A);
    tsq(i) = timeit(f,1);
    
    f = @() mtimes(I,A);
    teye(i) = timeit(f,1);
    
    fprintf('%d/%d \n', i, length(n));
end

h=figure;
loglog(n,teye,'bo-', n,tsq, 'rx-');
xlabel('log Matrix size');
ylabel('log Time (sec)');
l=legend('I*A', 'A*A','Location','NorthWest');
title('Time of basics linear operations');
saveas(h,'ask3d','png') %save figure