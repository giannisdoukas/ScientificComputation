function [A] = my_func(p, u, v, col)
    if nargin < 3 || nargin > 4
        fprintf('Error! \n function [A] = my_func(p, u, v, col).\n You have two give at least three arguments \n');
        return;
    end
    n = length(u);
    I = eye(n);
    
    if nargin == 3
        A = eye( n );        
        for i=1:p 
            A = A*(I - u*v');
        end
    else %nargin == 4
        A = zeros( n,1 );
        A(col) = 1;
        for i=1:p 
            A = (I - u*v')*A;
        end
    end
end