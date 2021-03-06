clear
line=importdata('pole_170_1200.dat'); 

vel(:,1)=line(:,4);
for i=1:9
    PT(i,1)=0.0;
end


for i=1:9
        sumtot=0;
        av=0;
        t=(i-1)*1200+1;
        e=0;
        sum=0;
        n=1;
    for j=t:1200*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/1200.;
    end 
    
     for j=t:1200*i
        sum=sum+(vel(j,1)-av).^2.;
        e=sqrt(1/(n-1)*sum);
        n=n+1;
     end
    PT(i,1)=av;
    E(i,1)=e;
end

x=0.2:0.222:2.0;
%1.65:-0.4:0.4;
%plot(x,PT,'bx')
%figure
herrorbar(PT,x,E,'+k')
hold on

poles=importdata('pole_5_cfd.dat');
pole(:,1)=poles(:,1);
xx=2.26:-0.0491:0.0491;
plot(pole,xx,'ro')