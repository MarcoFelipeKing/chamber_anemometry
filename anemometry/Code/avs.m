
x664cm=importdata('F:/surfaces/664cm.dat');
vel(:,1)=x664cm(:,2);
PT(66,1)=0.0;
sumtot=0.0;
av=0.0;
Z(6,11)=0.0;
Q=0.0;

for i=1:66
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

k=1;
for j=11:-1:1
    if (mod(j,2)==0) % ie if j is even
        for i=1:6
            Z(i,j)=PT(k,1);
            k=k+1;
        end
    else
        
        for i =6:-1:1
         
        Z(i,j)=PT(k,1);
        k=k+1;  
        end
    end
        
end
figure('color',[1 1 1])
Y=0.0:5:25.0;
X=-2.5:5.:47.5;
[X,Y]=meshgrid(X,Y);
[xi,yi]=meshgrid(-2.5:0.1:47.5,0.0:0.1:25.0);
zi1=interp2(X,Y,Z,xi,yi,'bicubic');
save('high_in.txt','zi1','-ASCII')
[C,h]=contourf(xi,yi,zi1);
hold on
colormap jet
colorbar
%{
colorbar('location','southside')
text_handle=clabel(C,h);
set(text_handle,'BackgroundColor',[1 1 .6],...
    'Edgecolor',[.7 .7 .7])
%}
hold off
X=-2.5:5.:47.5;
Q1=0.0;
Q2=0.0;

for i=1:6
    
        Q1=Q1+cumtrapz(X,Z(i,:));
    
end

Y=0.0:5:25.0;

for j=1:11
    Q2=Q2+cumtrapz(Z(:,j),Y);
end
Q=sum(Q1)+sum(Q2);
Q_f=@(w,h)interp2(X,Y,Z,w,h);
%N=dblquad(Q_f,0,36.,0,16.)
N=dblquad(Q_f,-2.5,47.5,0,25.);

figure('color',[1 1 1])
%plot(X,Z(4,:),'--sk','linewidth',2,'markerfacecolor','k')

x=-2.5:1:47.5;
y = interp1(X,Z(4,:),x,'spline');
 plot(X,Z(4,:),'o',x,y,'-ok','linewidth',2,'markerfacecolor','k')
axis([-2.5 50 0 0.8])
set(gca,'xticklabel',0:10:60) %'xtick',0:10:60,
xlabel('Horizontal position (cm)');
ylabel('Velocity magnitude (m/s)');
