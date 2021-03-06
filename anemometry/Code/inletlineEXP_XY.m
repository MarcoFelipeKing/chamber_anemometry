clear
EXP_XY=importdata('inlet_31.dat');%10_T_LINE.dat');%CFD_025cm_15_055vel.dat'); %CFD_025
XX(:,1)=-1*EXP_XY(:,1);
YY(:,1)=EXP_XY(:,2);
%YY(:,1)=YY(:,1)+0.1;
for i=1:numel(YY)
    E(i,1)=std(YY);
end
for i=numel(YY):-1:1
YYY(numel(YY)+1-i,1)=YY(i,1);
end

plot(XX,YYY,'k+-')
%errorbar(XX,YYY,E)
hold on

xlabel({'Distance from Inlet (m)'});
ylabel({'Velocity magnitude (m/s)'});