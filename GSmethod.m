function x=GSmethod(A,b,x0,iter)

x=x0;
D=diag(diag(A));
U=triu(A,1);
L=tril(A,-1);
DLf=(D+L)\b;
DLU=(D+L)\U;



for i=1:iter
    x=DLf-DLU*x;
end


