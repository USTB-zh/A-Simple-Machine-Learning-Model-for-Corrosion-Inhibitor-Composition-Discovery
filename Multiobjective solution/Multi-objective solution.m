[xm,ym]=fmincon('fun1min',[0 0],[],[],[],[],zeros(2,1),[],'fun2min');
disp('最小值y为');
disp(ymin);
disp('规划解x为')
disp(xmin);
[xd,yd]=fmincon('fun1max',[0 0],[],[],[],[],zeros(2,1),[],'fun2max');
disp('最小值y为');
disp(ymax);
disp('规划解x为')
disp(xmax);