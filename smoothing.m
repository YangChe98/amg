function x = smoothing(A,b,x,smooth,iters)
d = diag(A);
dinv = 1./d;
L = tril(A);
            U = triu(A,1);
for i = 1:iters
    if smooth == 1
        % Jacobi
        x = x + dinv.*(b-A*x);
    elseif smooth == 2
        % Guass-Siedel
        x = L\(b-U*x);
    end
end
end