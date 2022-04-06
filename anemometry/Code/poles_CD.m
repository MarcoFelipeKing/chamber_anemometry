clear
line=load('pole_CD_1.txt'); % 1_poles5_slot.txt
vel(:,1)=line(:,5);

PT(4,1)=zeros;
%{
for i=1:4
    PT(i,1)=0.0;
end
%}

for i=1:4%:-1:1
        sumtot=0;
        av=0;
        t=(i-1)*600+1;
        e=0;
        sum=0;
        n=1;
    for j=t:600*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/600.;
    end 
    
     for j=t:600*i
        sum=sum+(vel(j,1)-av).^2.;
        e=sqrt(1/(n-1)*sum);
        %e=std(vel,0,240);
        n=n+1;
     end
    PT(i,1)=av;
    E(i,1)=e;
end

x=1.65:-0.4:0.4;
%plot(x,PT,'bx')
%figure
herrorbar(PT,x,E,'+k')
hold on

poles=importdata('pole_1_CD_CFD.dat'); %pole_1_cfd.dat
pole(:,1)=poles(:,1);
s=size(pole);
dim=s(:,1);
space=2.26/dim;
if mod(2,dim)~=0
    fin=space;
else
    fin=0.0;
end
xx=2.26:-space:fin;
plot(pole,xx,'ro')
ylabel({'Height (m)'});
xlabel({'Velocity magnitude (m/s)'});
