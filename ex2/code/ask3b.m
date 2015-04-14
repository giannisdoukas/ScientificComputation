function [m_f_e, s_f_e] = ask3b(A,B)
% ASK3B
% INPUT
%  A        - First matrix for multiply    
%  B        - Second matrix for multiply
% OUTPUT
% m_f_e     - Mtimes forward error with norm inf 
% s_f_e     - Strassen forward error with nomr inf
    f_x = A*B;
    f_x_prog = mtimes(single(A), single(B));
    m_f_e = norm( f_x - f_x_prog, inf ) / norm( f_x, inf )
    
    f_x_prog = strassen(single(A), single(B));
    s_f_e = norm( f_x - f_x_prog, inf ) / norm( f_x, inf )
end