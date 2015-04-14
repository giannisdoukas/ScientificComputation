ask3a
ask3b
ask3g

h=figure
loglog(n,tmldividea,'bx-', n,tmldivideb,'r*-', n,tmldivideg,'ko-')
xlabel(' log matrix size ');
ylabel(' log mldivide time (sec)');
legend('random matrix A', 'lower triangular matrix', 'psychologically lower triangular matrix', 'Location','SouthEast');
title('Time of mldivide');
saveas(h,'askplot3','png')