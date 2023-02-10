A=xlsread('C:\Jmax3.5.xlsx','TRAIN');
n=length(A);
y=A(:,3);
x1=A(:,1);
x2=A(:,2);
[p,S] = polyfit(x1,y,2);
yb=polyval(p,x1);
corrco = min(min(corrcoef(y,yb))); %相关系数可用来衡量拟合效果
co_err = [corrco,S.normr];
a1=p(1)*x1.^2+p(2)*x1+p(3);

[p2,S] = polyfit(x2,y,3);
yb=polyval(p2,x2);
corrco = min(min(corrcoef(y,yb))); %相关系数可用来衡量拟合效果
co_err = [corrco,S.normr];
a2=p2(1)*x2.^3+p2(2)*x2.^2+p2(3)*x2+p2(4);
