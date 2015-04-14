n = 2.^[7:10];
tmldividea = zeros(length(n),1);

for i=1:length(n)
    A = rand( n(length(n)) );
    b = rand( n(length(n)) ,1);
    
    f = @() mldivide( A(1:n(i),1:n(i)), b(1:n(i)) );
    tmldividea(i) = timeit(f,1)
end