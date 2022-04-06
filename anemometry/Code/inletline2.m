clear
line=importdata('inletline2.dat');
vel(:,1)=line(:,2);

for i=1:4
    PT(i,1)=0.0;
end


for i=4:-1:1
        i;
        sumtot=0;
        av=0;
        t=(i-1)*3600+1;
        
    for j=t:3600*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/3600.;
        
    end 
    PT(i,1)=av;
end

x=0.6:0.7:3.36;
plot(x,PT,'bx')
hold on