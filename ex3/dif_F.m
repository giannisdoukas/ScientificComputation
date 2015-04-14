function F = dif_F(n, x_max, x_min)
    h = (x_max - x_min) / (n+1);
    F = zeros(n,1);
    j=1;
    F(1) = 3*eps(j*h)*(3*sin(3*j*h) - 2*cos(3*j*h)) ;
    for j=2:n-1
        F(j) = 3*eps(j*h)*(3*sin(3*j*h) - 2*cos(3*j*h));
    end
    j=n;
    F(j) = 3*eps(j*h)*(3*sin(3*j*h) - 2*cos(3*j*h)) - ( exp(pi/6) ) / (h^2) ;
end