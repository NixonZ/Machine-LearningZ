function [J grad] = nnCostFunction(nn_params, input_layer_size,hidden_layer1_size,hidden_layer2_size  ...
                                                                                    ,num_labels, X, y, lambda)
%roll theta back
Theta1=reshape(nn_params(1:5*5),5,5);
Theta2=reshape(nn_params(1+5*5:5*5+5*6),5,6);
Theta3=reshape(nn_params(1+5*5+5*6:end),3,6);



m=size(X,1);
Theta1_grad=zeros(size(Theta1));
Theta2_grad=zeros(size(Theta2));
Theta3_grad=zeros(size(Theta3));

DELTA1=zeros(size(Theta1));
DELTA2=zeros(size(Theta2));
DELTA3=zeros(size(Theta3));

J=0;
for i=1:m
%forward feed
    a1=X(i,:)';
    a1=[ones(1,1);a1];
    z2=Theta1*a1;
    a2=sigmoid(z2);
    a2=[ones(1,1);a2];
    z3=Theta2*a2;
    a3=sigmoid(z3);
    a3=[ones(1,1);a3];
    z4=Theta3*a3;
    predictions=sigmoid(z4);
    y_temp=zeros(size(predictions));
    y_temp(y(i),1)=1;
    J=J+(1/m)*(-(y_temp')*log(predictions)-(1-y_temp)'*log(1-predictions));
%back propagation    
    delta4=predictions-y_temp;
    delta3=((Theta3)'*delta4).*(a3.*(1-a3));
    delta3=delta3(2:end,1);
    delta2=((Theta2)'*delta3).*(a2.*(1-a2));
    delta2=delta2(2:end,1);
    DELTA3=DELTA3+delta4*a3';
    DELTA2=DELTA2+delta3*a2';
    DELTA1=DELTA1+delta2*a1';
end
temp_Theta1=Theta1;
temp_Theta1(:,1)=zeros(size(temp_Theta1(:,1)));
temp_Theta2=Theta2;
temp_Theta2(:,1)=zeros(size(temp_Theta2(:,1)));
temp_Theta3=Theta3;
temp_Theta3(:,1)=zeros(size(temp_Theta3(:,1)));
SqrTheta1=temp_Theta1.^2;
SqrTheta2=temp_Theta2.^2;
SqrTheta3=temp_Theta3.^2;
J=J+(lambda/(2*m))*(sum(SqrTheta1(:))+sum(SqrTheta2(:))+sum(SqrTheta3(:)));
Theta1_grad=(1/m)*DELTA1+(lambda/m)*(temp_Theta1);
Theta2_grad=(1/m)*DELTA2+(lambda/m)*(temp_Theta2);
Theta3_grad=(1/m)*DELTA3+(lambda/m)*(temp_Theta3);

%unroll grad
grad=[Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:)];
end

