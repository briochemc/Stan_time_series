data {
	int T; //number of time points
	real y0; //initial value 
	real lambda; //rate parameters [/time]
	real dt; //time step
}
parameters{}
model{}
generated quantities {
	vector[T] y_hat; //container for predictions
	y_hat[1] = y0; //set initial value
	for (t in 2:T) 
		y_hat[t] =  poisson_rng(lambda*y_hat[t-1]*dt);
}

