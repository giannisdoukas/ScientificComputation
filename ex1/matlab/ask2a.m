function [] = ask2a()
    n = 2.^[7:10];
    tlu = zeros(length(n), 1);
    tmul = zeros(length(n), 1);
    for i=1:length(n)
%       veltistopoiisi gia apofigi 
%       kathisterisis logo realocation
%       tou A kai tou b
        A = rand( n(length(n)) );
        b = rand( n(length(n)) ,1);

        tic;
        lu( A(1:n(i),1:n(i)) );
        tlu(i) = toc;
        
        tic;
        A(1:n(i),1:n(i))*b(1:n(i));
        tmul(i) = toc;
    end
      
    h=figure
    loglog(n,tlu,'b*-',n,tmul,'r*-');
    xlabel(' log matrix size ');
    ylabel(' log lu time (sec)');
    legend('lu time', 'mul time','Location','NorthWest');
    title('tic toc without loop');
    saveas(h,'ask2a','png')  
end