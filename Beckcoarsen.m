function [P,R]=Beckcoarsen(A);
[m,n]=size(A);
C=[];
F=[];

for i=1:n
    if (~ismember(i,C))&&(~ismember(i,F)) 
            C=[C;i];
    
        J=(i+1):n;
        JC=ismember(J,C);
        JF=ismember(J,F);
        for k=1:(n-i)
            if JC(k)==0&&JF(k)==0&&A(i,i+k)~=0
                F=[F;i+k];
            end
         end

    end
end
S=double(A(F,C)~=0);
lambda=sum(S,2);
P_F_C=S.*lambda.^(-1);
Clength=length(C);
P=sparse(n,Clength);
P(F,:)=P_F_C;
P(C,:)=speye(Clength);
R=P.';

        