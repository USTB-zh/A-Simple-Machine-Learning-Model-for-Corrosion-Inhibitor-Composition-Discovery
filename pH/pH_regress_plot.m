A=xlsread('C:\pH.xlsx','TRAIN');
n=length(A);
y=A(:,3);
x1=A(:,1);
x2=A(:,2);
X=[ones(n,1.00),x1,log(x2)];
[b,bint,r,rint,stats]=regress(y,X);

z=b(1)+b(2)*x1+b(3)*log(x2);
figure;
rcoplot(r,rint);
title('²Ð²îÍ¼µÄ»æÖÆ');
xlabel('Êý¾Ý');
ylabel('²Ð²î');

A1=xlsread('C:\pH.xlsx','TEST');
x1j=A1(:,1);
x2j=A1(:,2);
yj=A1(:,3);
zj=b(1)+b(2)*x1j+b(3)*log(x2j);

figure;%»­Í¼
x3=7:0.01:9;
y3=x3;
plot(y,z,'.r',yj,zj,'.b',x3,y3,'--k','linewidth',2,'MarkerSize',30);
xlabel('\bf{measured pH}','Fontname','Arial');
ylabel('\bf{predicted pH}','Fontname','Arial');
set(gca,'linewidth',2);
set(gca,'XTick',0:0.5:18);
set(gca,'YTick',0:0.5:18);
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
