function J = computeCost(X, y, theta)
m=size(X,1);
J=0;
predictions=X*theta;
error=predictions-y;
SqrError=error.^2;
J=(1/(2*m))*sum(SqrError);
end

