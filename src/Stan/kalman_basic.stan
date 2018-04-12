data {
	int T; //number of data points
	vector[T] y; //extract y variable
}

parameters {
	vector[T] x; //declare pdf variable for underlying state
	real alpha; //declare pdf variable for autoregressive parameter
	real<lower=1E-15> sigma_obs; //declare bounded pdf for sigma_obs
	real<lower=1E-15> sigma_mod; //bounded pdf for sigma_mod
}

model {
	for(i in 1:T){ //need loop here because y is 'conditionally independent'
		y[i] ~ normal(x[i] , sigma_obs); //data mode: given x, y is draw from the measurement error distribution
	}
	for(i in 2:T){
		x[i] ~ normal(alpha*x[i-1],sigma_mod); //dynamic model: given x[t-1], x[t] is an independent prediction from the model
	}
}

