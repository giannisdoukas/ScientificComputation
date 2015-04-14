function [A] = newMatrix(n,conditionNumber)
	conditionNumber = 10^4;
	A = orth(rand(n));
	w = diag(linspace(conditionNumber,1,n));
	A = A*w;
