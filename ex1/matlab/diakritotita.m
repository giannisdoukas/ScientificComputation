nmax = 100:100:100000;
t=0;
a = 0; b=0; c=0;
for i=0:length(nmax)
    tic;
    a = b+c;
    t = t + toc;
end
t = t/length(nmax)