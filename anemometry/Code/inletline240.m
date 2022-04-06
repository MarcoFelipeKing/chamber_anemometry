clear
line=importdata('inletline0507.dat');
vel(:,1)=line(:,4);

for i=1:11
    PT(i,1)=0.0;
end


for i=11:-1:1
        i;
        sumtot=0;
        av=0;
        t=(i-1)*240+1;
        e=0;
        sum=0;
        n=1;
    for j=t:240*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/240.;
    end 
    
     for j=t:240*i
        sum=sum+(vel(j,1)-av).^2.;
        e=sqrt(1/(n-1)*sum);
        %e=std(vel,0,240);
        n=n+1;
     end
    PT(i,1)=av;
    E(i,1)=e;
end

x=3.36:-0.3055:0.0;%0.0:0.3055:3.36;
%plot(x,PT,'bx')
%figure
errorbar(x,PT,E,'xr')
hold on