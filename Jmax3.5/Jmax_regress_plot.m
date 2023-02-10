A=xlsread('C:\max3.5.xlsx','TRAIN');
n=length(A);
y=A(:,3);
x1=A(:,1);
x2=A(:,2);
X=[ones(n,1.00),0.8956*x1.^2-6.3477*x1+13.3617,0.1369*x2.^3-2.5123*x2.^2+15.1034*x2-25.0068];
[b,bint,r,rint,stats]=regress(y,X);
figure;
rcoplot(r,rint);
title('²Ð²îÍ¼µÄ»æÖÆ');
xlabel('Êý¾Ý');
ylabel('²Ð²î');

z=b(1)+b(2)*(0.8956*x1.^2-6.3477*x1+13.3617)+b(3)*(0.1369*x2.^3-2.5123*x2.^2+15.1034*x2-25.0068);

A1=xlsread('C:\Jmax3.5.xlsx','TEST');
x1j=A1(:,1);
x2j=A1(:,2);
yj=A1(:,3);
zj=b(1)+b(2)*(0.8956*x1j.^2-6.3477*x1j+13.3617)+b(3)*(0.1369*x2j.^3-2.5123*x2j.^2+15.1034*x2j-25.0068);


figure;%»­Í¼
x3=0:0.01:20;
y3=x3;
plot(y,z,'.r',yj,zj,'.b',x3,y3,'--k','linewidth',2,'MarkerSize',30);
xlabel('\bf{measured J} (¦ÌA cm^-^2)','Fontname','Arial');
ylabel('\bf{predicted J} (¦ÌA cm^-^2)','Fontname','Arial');
set(gca,'linewidth',2);
set(gca,'XTick',0:4:18);
set(gca,'YTick',0:4:18);
legend('train','test','location','best')
c=abs(y-z);

MAE=(sum(c))/n;
disp('MAE=');
disp(MAE);
RMSE=sqrt(sum((y-z).^2)./n);
disp('RMSE=')
disp(RMSE);
MSE=(sum((y-z).^2))./n;
disp('MSE=')
disp(MSE);

cj=abs(yj-zj);
MAEj=(sum(cj))/n;
disp('MAEj=');
disp(MAEj);
RMSEj=sqrt(sum((yj-zj).^2)./n);
disp('RMSEj=');
disp(RMSEj);
MSEj=(sum((yj-zj).^2))./n;
disp('MSEj=');
disp(MSEj);