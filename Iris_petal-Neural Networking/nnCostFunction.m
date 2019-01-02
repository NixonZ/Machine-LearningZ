function [J grad] = nnCostFunction(nn_params, input_layer_size,hidden_layer1_size,hidden_layer2_size  ...
                                                                                    ,num_labels, X, y, lambda)
%roll theta back
Theta1=reshape(nn_params(1:hidden_layer1_size*(1+input_layer_size),hidden_layer1_size,(1+input_layer_size)));
Theta2=reshape(nn_params(1+hidden_layer1_size*(1+input_layer_size):hidden_layer2_size*(1+hidden_layer1_size), ...
                                                                        hidden_layer2_size,(1+hidden_layer1_size)));
Theta3=reshape(nn_params(1+hidden_layer2_size*(1+hidden_layer1_size):num_labels*(1+hidden_layer2_size), ...
                                                                          num_labels,(1+hidden_layer2_size)));



m=size(X,1);
Theta1_grad=zeros(size(Theta1));
Theta2_grad=zeros(size(Theta2));
Theta3_grad=zeros(size(Theta3));


for i=1:m
%forward feed
    a1=X(i,:);
    a1=[ones(1,1);a1];
    z2=Theta1*a1;
    a2=sigmoid(z2);
    a2=[ones(1,1);a2];
    z3=Theta1*a2;
    a3=sigmoid(z3);
    a3=[ones(1,1);a3];
    z4=Theta1*a3;
    predictions=sigmoid(z4);

end

