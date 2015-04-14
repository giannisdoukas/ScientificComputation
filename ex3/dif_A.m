function A = dif_A(n, x_max, x_min)
    h = (x_max - x_min) / (n+1);
    a = 2/(h^2) + 1;
    g = -1/(h^2);
    b = -1/(h^2) ;
    A = trid(g, a, b, n);
end

function A = trid(g, a, b, n)
    A = zeros(n,n);
    A(1,1) = a;
    A(1,2) = b;    
    for j=2:n-1
        A(j, j-1) = g;
        A(j, j)   = a;
        A(j, j+1) = b;
    end
    A(n, n-1) = g;
    A(n, n)   = a;
end
