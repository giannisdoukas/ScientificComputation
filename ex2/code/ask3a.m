function [cn, e_sx_sf, b_sf, b_c, db_b, x_prog] = ask3a(A)
% ASK3 
% INPUT
%   A           - matrix
% OUTPUT
%   cn          - condition number
%   e_sx_sf     - forward error
%   b_sf        - backward error with norm infinity
%   b_c         - backward error
%   db_b        - || b^ - b || / || b ||

    n = length(A);
    cn = cond(A, inf);

    x = ones(n,1);
    b = A*x;
    
    x_prog = A \ b;
    
    % forward error
    e_sx_sf = norm(x_prog - x, inf) / norm(x, inf);
    
    % backward error with norm inf
    b_sf = norm( A*x_prog - b , inf) / (norm( A , inf) * norm( x_prog , inf) + norm( b , inf));
    
    % backward error
    b_c = norm( A*x_prog - b , inf ) / (norm( A , inf) * norm( x_prog , 1) + norm( b , inf));

    db_b = norm( A*x_prog - b, inf ) / norm( b, inf );
end
