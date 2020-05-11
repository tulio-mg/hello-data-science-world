function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
h = X * theta;
error = h - y;
error_sqr = error.^2;
J_unregularized = 1/(2*m)*sum(error_sqr);

theta(1) = 0;
theta_sum = sum(theta.^2);
reg_therm_J = theta_sum*(lambda/(2*m));

J = J_unregularized + reg_therm_J;
% =========================================================================

grad = grad(:);
unreg_grad = (X' * error)*(1/m);
theta(1) = 0;
reg_therm_grad = theta * (lambda/m);
grad =  unreg_grad + reg_therm_grad; 

end
