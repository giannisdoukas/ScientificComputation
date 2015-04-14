n = 2.^[7:10];
tmldivideb = zeros(length(n),1);

for i=1:length(n)
    L = tril( rand( n(i) ) );
    b = rand( n(i), 1 );
        
    f = @() mldivide( L, b );
    tmldivideb(i) = timeit(f,1)
end