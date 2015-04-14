n = 15:2:25;
x_1 = zeros( 1,length(n) );
x_n = zeros( 1,length(n) );
colors = ['yo', 'm*', 'cx', 'rd', 'gV', 'bp','kh'];
c = 1:2;
h = figure;
grid on
hold on
for i=1:length(n),
    a_n = poly(0:n(i));
    x_1(i) = polyval( a_n, 1 );
    x_n(i) = polyval( a_n, n(i) );
    r = roots( a_n );
    
    plot( real(r), imag(r), colors( c ));
    c = c+2;
    clear a_n r
    
end
plot(0:n(i), zeros(n(i)+1,1), colors( c ));
legend('n=15','n=17','n=19','n=21','n=23','n=25', 'real roots','Location','NorthWest');
xlabel(' real ');
ylabel(' imaginary ');
title(' Roots ');
x_1
x_n
hold off
%saveas(h,'askplot3','eps')