function [V,M] = find_sf(A,B,C)
	Fr = 500; % N
	shaft_length = 40/100; % m
	[Fk1, Fk2] = spring_forces(A,B,C);

	A = A/100; B = B/100; C = C/100;

	x = linspace(0,shaft_length,1000);

	% Creating signularity functions for shear
	y1 = sf_step(x,A); y2 = sf_step(x,B); y3 = sf_step(x,C);

	% Creating singularity functions for moment
	y4 = sf_slope(x,A); y5 = sf_slope(x,B); y6 = sf_slope(x,C);

	% Complete Singularity 
	V = Fr*y1 + Fk1*y2 + Fk2*y3;
	M = Fr*y4 + Fk1*y5 + Fk2*y6;

end

% Helper Functions
function y = sf_step(x,a)
	y = (x>a);
end

function y = sf_slope(x,a)
	y =(x-a).*(x > a);
end
