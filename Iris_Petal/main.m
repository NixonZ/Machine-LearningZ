clear; close all; clc;
%Regularized multiclass logistic regression
%% =============== Load Data============
data=load('iris.data.txt');
X=data(:,1:4);
y=data(:,5);
num_labels=3;
lambda=0.1;
[m,n]=size(X);
%Add x0 to X
X=[ones(m,1),X];
%%================== Compute Cost and gradient ==============
theta=zeros(n+1,1);
initial_theta = zeros(n + 1, 1);
[J, grad] = computecost(initial_theta, X, y,lambda);

fprintf('Cost at initial theta (zeros): %f\n', J);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

%% ============= Optimizing using fminunc oneVSall  =============

[all_theta]=onevsall(X,y,num_labels,lambda);

fprintf(' %f \n', all_theta);

test=sigmoid([1,5.1,3.5,1.4,0.2]*all_theta(1,:)');
fprintf('\nTesting with the first test case:\n');
fprintf('%f percent probability of case 1\n',test*100);
fprintf('\nProgram paused. Press enter to continue.\n');