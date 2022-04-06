clear
line=importdata('inletline.dat');
vel(:,1)=line(:,4);

for i=1:4
    PT(i,1)=0.0;
end


for i=1:4
        i;
        sumtot=0;
        av=0;
        t=(i-1)*120+1;
        
    for j=t:120*i
        sumtot=sumtot+vel(j,1);
        av=sumtot/120.;
        
    end 
    PT(i,1)=av;
end

x=0.6:0.7:3.36;
plot(x,PT,'g+')
hold on
