clear
line=load('inletline1200.dat');
vel(:,1)=line(:,4); %import it manually and use line(:,4)


for i=1:11
    PT(i,1)=0.0;
end


for i=1:11%:-1:1
        i;
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
        %e=std(vel,0,240);
        n=n+1;
     end
    PT(i,1)=av;
    E(i,1)=e;
end

x=0.0:0.3055:3.36;%3.36:-0.3055:0.0;%
%plot(x,PT,'bx')
%figure
errorbar(x,PT,E,'+k')
hold on
xlabel({'Distance from Inlet (m)'});
ylabel({'Velocity magnitude (m/s)'});

%%%%%%%%%%%%%%%%

temp(:,1)=line(:,2);

for i=1:11
    PT(i,1)=0.0;
end


for i=1:11%:-1:1
        i;
        sumtot=0;
        av=0;
        t=(i-1)*1200+1;
        e=0;
        sum=0;
        n=1;
    for j=t:1200*i
        sumtot=sumtot+temp(j,1);
        av=sumtot/1200.;
    end 
    
     for j=t:1200*i
        sum=sum+(temp(j,1)-av).^2.;
        e=sqrt(1/(n-1)*sum);
        %e=std(vel,0,240);
        n=n+1;
     end
    PT(i,1)=av;
    E(i,1)=e;
end

x=0.0:0.3055:3.36;%3.36:-0.3055:0.0;%
%plot(x,PT,'bx')
%figure
errorbar(x,PT,E,'+k')
hold on
xlabel({'Distance from Inlet (m)'});
ylabel({'Temp ºC'});