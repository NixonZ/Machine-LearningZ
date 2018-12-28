function [all_theta]=onevsall(X,y,num_labels,lambda)
[m,n]=size(X);
n=n-1;
all_theta=zeros(num_labels,n+1);
initial_theta=zeros(n+1,1);
theta=zeros(n+1,1);
for i=1:num_labels
    options=optimset('GradObj','on','MaxIter',400);
    [theta,cost]=fmincg(@(t)computecost(t,X,(y==i),lambda),initial_theta,options);
    all_theta(i,:)=theta';
end
end

