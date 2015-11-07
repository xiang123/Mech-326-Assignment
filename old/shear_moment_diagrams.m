function sm_plot = shear_moment_diagrams(A,B,C,Fr,Fk1,Fk2)
	% Given
	A = A/100; B = B/100; C = C/100;
	shaft_length = 0.4; % m

	x = linspace(0,shaft_length,1000);
	% Plots
	% x_AB = linspace(0,AB);
	% x_BC = linspace(AB,AB+BC);
	% x_CD = linspace(AB+BC,shaft_length);

	y1 = sf_step(x,A);
	y2 = sf_step(x,B);
	y3 = sf_step(x,C);

	y4 = sf_slope(x,A);
	y5 = sf_slope(x,B);
	y6 = sf_slope(x,C);

	% x = [x_AB x_BC x_CD];

	% F_AB = Fr * ones(1,100);
	% F_BC = (Fr + Fk1) * ones(1,100);
	% F_CD = zeros(1,100);
	% F = [F_AB F_BC, F_CD];


	V = Fr*y1 + Fk1*y2 + Fk2*y3;
	M = Fr*y4 + Fk1*y5 + Fk2*y6;
	% Shear Diagram
	figure(1)
	plot(x,V)
	axis([0 0.4 (Fr+Fk1)-200 Fr+200])

	figure(2)
	plot(x,M)
	% Moment Diagram
	% figure(2)
	% % plot(x_AB, Fr*x_AB, x_BC, (Fr + Fk1)*linspace(0,BC) + Fr*AB, x_CD, 0)
	% plot([x_AB x_BC x_CD], [Fr*x_AB (Fr + Fk1)*linspace(0,BC)+Fr*AB F_CD])
	% axis([0 0.4 -10 (Fr*AB)+10])
end

function y = sf_step(x,a)
	y = (x>a);
end

function y = sf_slope(x,a)
	y =(x-a).*(x > a);
end