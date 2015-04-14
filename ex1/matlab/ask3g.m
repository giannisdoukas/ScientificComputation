n = 2.^[7:10];
tmldivideg = zeros(length(n),1);

for i=1:length(n)
    p = randperm( n(i) );
    L = tril( rand( n(i) ));
    L = L(:,p);
    b = rand( n(i), 1 );
    
    f = @() mldivide( L, b );
    tmldivideg(i) = timeit(f,1)
end