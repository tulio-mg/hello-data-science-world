function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X * theta);
first_therm = (log(h))' * (-y);
second_therm = (log((1 - h)))' * (1 - y);
unreg_h = first_therm - second_therm;

theta(1) = 0;
theta_square = theta' * theta;
h_thermreg = theta_square * (lambda/(2*m));

J = ((1/m) * unreg_h) + h_thermreg;

grad_unregularized = (X' *(h - y))*(1/m);
grad_regularization =  theta * (lambda/m) ;
grad = grad_unregularized + grad_regularization;
% =============================================================

end
