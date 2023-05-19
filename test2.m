clc
clear
A=[2 -1 0 0;
    -1 2 -1 0;
    0 -1 2 -1;
    0 0 -1 2 ];
b=[1;1;1;1];
x0=zeros(4,1);
iter=10;
x1=GSmethod(A,b,x0,iter);
x2=smoothing(A,b,x0,2,iter);
x3=weightJacobimethod(A,b,x0,1,iter);
x4=smoothing(A,b,x0,1,iter);
%  Ac=Beckcoarsen(A);
%  Ac2=RScoarsen(A);
% [m,n]=size(A);
% C=[];
% F=[];
% 
% for i=1:n
%     if (~ismember(i,C))&&(~ismember(i,F)) 
%             C=[C;i];
%     
%         J=(i+1):n;
%         JC=ismember(J,C);
%         JF=ismember(J,F);
%         for k=1:(n-i)
%             if JC(k)==0&&JF(k)==0&&A(i,i+k)~=0
%                 F=[F;i+k];
%             end
%          end
% 
%     end
% end
% S=double(A(F,C)~=0);
% lambda=sum(S,2);
% P_F_C=S.*lambda.^(-1);
% Clength=length(C);
% P=sparse(n,Clength);
% P(F,:)=P_F_C;
% P(C,:)=speye(Clength);
% A_c=P.'*A*P;
% 
%         