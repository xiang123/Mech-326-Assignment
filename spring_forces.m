% Location of A,B,C in cm
function [Fk1, Fk2] = spring_forces(A,B,C)
	shaft_length = 40; % cm
	x1 = (shaft_length - C)/100 % m
	x2 = (C-B)/100
	x3 = (B-A)/100
	A = [(x1+x2) -x1 500*(x1+x2+x3); 1 -1 500]
	X = rref(A)
	Fk1 = -X(1,3);
	Fk2 = X(2,3);
end