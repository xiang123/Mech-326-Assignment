function y = sf_step(x,a)
	y = (x>a);
end

function y = sf_slope(x,a)
	y =(x-a).*(x > a);
end

function y = sf_quad(x,a)
	y = ((x-a).^2).*(x > a);
end

function y = sf_cubic(x,a)
	y = ((x-a).^3).*(x > a);
end
