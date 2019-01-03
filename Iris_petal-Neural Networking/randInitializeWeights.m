function W = randInitializeWeights(L_in, L_out)
INIT_EPSILON=sqrt(6)/(sqrt(L_in+L_out));
W=rand(L_out,L_in)*(2*INIT_EPSILON-INIT_EPSILON);
end

