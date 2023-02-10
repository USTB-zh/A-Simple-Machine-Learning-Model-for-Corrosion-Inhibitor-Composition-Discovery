A=xlsread('C:\Jmin3.5.xlsx','TRAIN');
n=length(A);
y=A(:,3);
x1=A(:,1);
x2=A(:,2);
X=[ones(n,1.00),0.1007561*x1.^3+0.3133879*x1.^2-5.0335*x1+11.5191,0.3312153*x2.^2-3.0776*x2+8.9652];
[b,bint,r,rint,stats]=regress(y,X);
figure;
rcoplot(r,rint);
title('²Ð²îÍ¼µÄ»æÖÆ');
xlabel('Êý¾Ý');
ylabel('²Ð²î');

z=b(1)+b(2)*(0.1007561*x1.^3+0.3133879*x1.^2-5.0335*x1+11.5191)+b(3)*(0.3312153*x2.^2-3.0776*x2+8.9652);

A1=xlsread('C:\Jmin3.5.xlsx','TEST');
x1j=A1(:,1);
x2j=A1(:,2);
yj=A1(:,3);
zj=b(1)+b(2)*(0.1007561*x1j.^3+0.3133879*x1j.^2-5.0335*x1j+11.5191)+b(3)*(0.3312153*x2j.^2-3.0776*x2j+8.9652);

figure;%»­Í¼
x3=0:0.01:15;
y3=x3;
plot(y,z,'.r',yj,zj,'.b',x3,y3,'--k','linewidth',2,'MarkerSize',30);
xlabel('\bf{measured J} (¦ÌA cm^£­^2)','Fontname','Arial');
ylabel('\bf{predicted J} (¦ÌA cm^£­^2)','Fontname','Arial');
set(gca,'linewidth',2);
set(gca,'XTick',0:4:16);
set(gca,'YTick',0:4:16);
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
