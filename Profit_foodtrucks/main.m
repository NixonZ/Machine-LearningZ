clear; close all; clc;
data=load('ex1data1.txt');
X=data(:,1);
y=data(:,2);
[m,n]=size(X);

figure;
plot(X,y,'rx','MarkerSize',10);
ylabel('Profit in $10,000');
xlabel('Population of city in 10,000');

X=[ones(m,1),X];
iterations = 1500;
alpha = 0.01;
theta=zeros(n+1,1);
J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);


theta = gradientDescent(X, y, theta, alpha, iterations);
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

hold on;
plot(X(:,2),X*theta,'-');
legend('training data','linear regression');
hold off;