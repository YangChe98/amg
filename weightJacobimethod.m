function x=weightJacobimethod(A,b,x0,weight,iter)

x=x0;
D=diag(A);
Dinv=diag(1./D);



for i=1:iter
    x=x+weight*Dinv*(b-A*x);
end

