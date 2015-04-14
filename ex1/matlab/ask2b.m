function [] = ask2b()
    n = 2.^[7:10];
    tlu = zeros(length(n), 1);
    tmul = zeros(length(n), 1);

    for i=1:length(n) 
%       veltistopoiisi gia apofigi 
%       kathisterisis logo realocation
%       tou A kai tou b
        A = rand( n(length(n)) );
        b = rand(n(length(n)),1);

        loops = 100;
        tic;
        for j=1:loops            
            lu( A(1:n(i),1:n(i)) );
        end
        tlu(i) = toc/loops
            
        tic;
        for j=1:loops            
            A(1:n(i),1:n(i))*b(1:n(i));
        end
        tmul(i) = toc/loops
        
    end
    
    h=figure
    loglog(n,tlu,'bo-',n,tmul,'r*-');
    xlabel(' log matrix size ');
    ylabel(' log lu time (sec)');
    legend('lu time', 'mul time','Location','NorthWest');
    title('tic toc');
    saveas(h,'ask2b','png')
end