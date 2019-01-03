clear; close all; clc

data=load('iris.data.txt');
X=data(:,1:4);
y=data(:,5);

input_layer_size  = 4;
hidden_layer1_size= 5;
hidden_layer2_size= 5;
num_labels = 3;

Theta1=zeros(hidden_layer1_size,input_layer_size+1);
Theta2=zeros(hidden_layer2_size,hidden_layer1_size+1);
Theta3=zeros(num_labels,hidden_layer2_size+1);

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:); Theta3(:)];

% Calculate Cost with regularization
lambda=0.01;
J = nnCostFunction(nn_params, input_layer_size,hidden_layer1_size, hidden_layer2_size,num_labels, X, y, lambda);

%random initializing parameters to break the symmetry
initial_Theta1=randInitializeWeights(hidden_layer1_size,input_layer_size+1);
initial_Theta2=randInitializeWeights(hidden_layer2_size,hidden_layer1_size+1);
initial_Theta3=randInitializeWeights(num_labels,hidden_layer2_size+1);

initial_nn_params=[initial_Theta1(:) ; initial_Theta2(:) ; initial_Theta3(:)];

%Traing NN
options=optimset('MaxIter',50);
%Shorthand for function to be reduced
costFunc=@(p)nnCostFunction(p, input_layer_size,hidden_layer1_size,hidden_layer2_size,num_labels, X, y, lambda);
%Now costFunc is a function that takes only one parameter
[nn_params,cost]=fmincg(costFunc,initial_nn_params,options);

Theta1=reshape(nn_params(1:5*5),5,5);
Theta2=reshape(nn_params(1+5*5:5*5+5*6),5,6);
Theta3=reshape(nn_params(1+5*5+5*6:end),3,6);                          
%Testing the parameters with 1st case
pred=predict(Theta1,Theta2,Theta3,X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);