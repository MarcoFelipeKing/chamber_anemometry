clear
line=importdata('3_inlet_line.dat');
vel(:,1)=line(:,2);
for i=1:68
    y(i,1)=0.1;
end

hold on
x=0.0494:0.0494:3.36;
vel-y;
plot(x,vel,'k--')

