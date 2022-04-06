clear
line=importdata('inletline120.dat');
vel(:,1)=line(:,4);

for i=1:4
    PT(i,1)=0.0;
end


for i=1:11
        i;
        sumtot=0;
        av=0;
        t=(i-1)*120+1;
        e=0;
        sum=0;
        n=1;
    for j=t:120*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/120.;
        
    end
     for j=t:120*i
        sum=sum+(vel(j,1)-av).^2.;
        e=sqrt(1/(n-1)*sum);
        n=n+1;
     end
    E(i,1)=e;
    PT(i,1)=av;
end

x=0.3:0.3:3.36;
%plot(x,PT,'bo')
%boxplot(PT)
errorbar(x,PT,E,'ob')
hold on