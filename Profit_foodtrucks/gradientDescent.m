function [theta,J_history] = gradientDescent(X, y, theta, alpha, iterations)
J_history=zeros(iterations,1);
m=size(X,1);
for iter=1:iterations
    prediction=X*theta;
    error=prediction-y;
    theta=theta-(alpha/m)*(X')*(error);
    J_history(iter)=computeCost(X,y,theta);
end