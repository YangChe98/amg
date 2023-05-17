function Ac=RScoarsen(A,theta);
if nargin==1
theta=0.25;
end
N=max(abs(A-diag(diag(A))),[],2);
[m,n]=size(A);

S=double(abs(A)-theta*N>0);
S=S-diag(diag(S));
lambda=sum(S,1);
C=[];
F=[];
Clength=length(C);
Flength=length(F);

for h=1:n
    Clength=length(C);
    Flength=length(F);
    if(Clength+Flength>= n)
        break
    end
    [maxlambda,i]=max(lambda);
    C=[C;i];
    lambda(i)=-1;
    for j=1:n
        if(S(i,j)==1 && lambda(j)~=-1)
            F=[F;j];
            lambda(j)=-1;
            for k=1:n
                if(S(j,k)==1 && lambda(k)~=-1)
                    lambda(k)=lambda(k)+1;
                end
            end
        end
    end
end
C=sort(C);
F=sort(F);
Flength=length(F);
Clength=length(C);

Omega=zeros(Flength,Clength);


Ci=S(F,C);
Dis=S(F,F);
Dis=Dis-diag(diag(Dis));
ACi=A(F,C);
ADis=A(F,F);
S1=S+speye(n);
Dw=double(~S1(F,:));
ADw=A(F,:);
sumkCi=sum(ACi.*Ci,2);
sumADw=sum(ADw.*Dw,2);
for i=1:Flength
    for j=1:Clength
        iindex=F(i);
        jindex=C(j);
        summds=0;
        for m=1:Flength
            mindex=F(m);
            if Dis(i,m)~=0
                summds=summds+A(iindex,mindex)*A(mindex,jindex)/sumADw(m);
            end
        end
        Omega(i,j)=-(A(iindex,jindex)+summds)/(A(iindex,iindex)+sumADw(i));
    end
end
P=sparse(n,Clength);
P(C,:)=speye(Clength);
P(F,:)=Omega;
Ac=P.'*A*P;