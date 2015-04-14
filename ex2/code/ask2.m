x = single(x);

fprintf('--- apo aristera deksia --- \n');
sum = single( x(1) );
for i=2:length(x),
    sum = sum + single( x(i) );
end
disp(sum);

fprintf('--- taksinomimeno --- \n');
x_sort = single( sort(x) );
sum_s = single( x_sort(1) );
for i=2:length(x_sort),
    sum_s = sum_s + x_sort(i);
end
disp(sum_s);

fprintf('--- epanataksinomimeno --- \n');
x_ss = single( x_sort )';
for i=1:length(x)-1,
    sum_ss = x_ss(1) + x_ss(2);

    x_ss(2) = sum_ss;
    x_ss = x_ss(2:length(x_ss));
    x_ss = sort( x_ss );
    
end
disp(sum_ss)

fprintf('--- Pichat & Neumaier  --- \n');
s = single(x(1));
e = 0;
for i=2:length(x),
    if abs(s) >= abs(x(i))
        [s,e_i] = fast2sum(s, x(i));
    else
        [s,e_i] = fast2sum(x(i), s);
    end
    e = e + e_i;
end
s = s + e;
disp(s)