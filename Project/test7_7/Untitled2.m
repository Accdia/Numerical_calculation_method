clc
clear
x=[0,3,5,7,9,11,12,13,14,15];
y=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6];
x1=0:0.5:15;
y1=interp1(x,y,x1,'spline');
subplot(3,2,1);scatter(x,y);
subplot(3,2,2);plot(x1,y1);

x=[0,3,5,7,9,11,12,13,14,15];
y=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.4,1.4];
xi=0:0.5:15;
y1=interp1(x,y,xi,'linear');

y2=lagrange(x,y,xi);
y3=newton(x,y,xi);
y4=interp1(x,y,xi,'spline');

subplot(3,2,3);
scatter(x,y);hold on
plot(xi,y2);title('拉格朗日插值');

subplot(3,2,4);
scatter(x,y);hold on
plot(xi,y3);title('牛顿插值');

subplot(3,2,5);
scatter(x,y);hold on
plot(xi,y4);title('三样条插值');
