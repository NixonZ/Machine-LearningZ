function [J,grad] = computecost(theta, X, y,lambda)

[m,n]=size(X);
n=n-1;
prediction=sigmoid(X*theta);
error=prediction-y;
J=(1/m)*(-(y')*log(prediction)-(1-y)'*log(1-prediction))+(lambda/(2*m))*(theta'*theta);
grad=zeros(n+1,1);
grad=(1/m)*(X')*error;
temp=theta;
temp(1,1)=0;
grad=grad+(lambda/m)*temp;


end

