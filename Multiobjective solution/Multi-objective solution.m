[xm,ym]=fmincon('fun1min',[0 0],[],[],[],[],zeros(2,1),[],'fun2min');
disp('��СֵyΪ');
disp(ymin);
disp('�滮��xΪ')
disp(xmin);
[xd,yd]=fmincon('fun1max',[0 0],[],[],[],[],zeros(2,1),[],'fun2max');
disp('��СֵyΪ');
disp(ymax);
disp('�滮��xΪ')
disp(xmax);