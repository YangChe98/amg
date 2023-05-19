function [x,res] = multigrid(A,b,pre,post,cycle,smooth,grids,maxit,tol,x0)

%    A = A matrix (n x n)
%    b = Right hand side vector (n x 1)
%    pre = Number of presmoothing iterations
%    post = Number of postsmoothing iterations
%    cycle = Type of multigrid cycle (1=V-cycle, 2=W-cycle, 3=F-cycle)
%    smooth = Smoother type (1=Jacobi, 2=Gauss-Seidel)
%    grids = Max grids in cycle, used for grids level during recursion
%    maxit = Max iterations of solver
%    tol = Tolerance of solver
% OPTIONAL:
%    x0 = Initial Guess
% OUTPUTS:
%    x = Solution vector
%    res = Residual vector
if  nargin<10
        x = b*0;
    else
        x = x0;
end

     res = zeros(maxit,1);
weight=1;
     for ii=1:maxit
         % presmoothing
         if smooth==1
             x=weightJacobimethod(A,b,x,weight,pre);
         elseif smooth == 2 
               x=GSmethod(A,b,x0,pre);
         end
         