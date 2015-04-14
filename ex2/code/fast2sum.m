function [s,t] = fast2sum(a,b)
    s = a+b;
    z = s-a;
    t = b-z;
end