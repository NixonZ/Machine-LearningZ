function p=predict(Theta1,Theta2,Theta3,X)
m=size(X,1);
a1=X;
a1=[ones(m,1),a1];
a2=sigmoid(a1*Theta1');
a2=[ones(m,1),a2];
a3=sigmoid(a2*Theta2');
a3=[ones(m,1),a3];
predictions=sigmoid(a3*Theta3');
[temp p]=max(predictions,[],2);
end

