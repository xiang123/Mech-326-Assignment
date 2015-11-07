% Returns the max bending moment based on input distances between forces
% Inputs: AB - distance between radial force and first bearing (in m)
%		  BC - distance between first and second bearing (in m)
function sigma_max = max_bending_moment(AB, BC)
	% Given
	Fr = 500; % N
	k = 37.8 * 1000; % N/m

	% Sum of moments about point A
	% Fk1 * AB = Fk2 * (AB + BC) (Fk - spring force)
	% Fk = -k*x
	% x1 * AB = x2 * (AB + BC)

	x2 = -Fr * AB / ( k * BC );

	% Sum of moments about point B
	% Fr * AB = k*x2 * BC
	% x2 = Fr * AB / ( k * BC )

	% x1 = -x2 * (AB + BC) / AB;

	% From sum of forces
	x1 = Fr / k * (1 + AB/BC)

	% Finding Spring Forces
	Fk1 = -k * x1
	Fk2 = -k * x2
	
	sigma1 = Fr * AB;
	sigma2 = (Fr + Fk1) * BC;

	if (sigma1 > sigma2)
		sigma_max = sigma1;
	else
		sigma_max = sigma2;
	end

	shear_moment_diagrams(AB,BC,Fr,Fk1,Fk2)

end