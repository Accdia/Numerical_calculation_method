clc;clear;
x=[0,3,5,7,9,11,12,13,14,15];
y=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6];%输入原始数据

x1=0:0.5:15;
y1=interp1(x,y,x1,'spline');%设计机翼下轮廓线
y2=lagrange(x,y,x1);
y3=newton(x,y,x1);
y4=interp1(x,y,x1,'spline');%调用对应函数进行计算拟合

subplot(2,2,1);scatter(x1,y1);hold on;plot(x1,y1);title("机翼下轮廓线");
subplot(2,2,2);scatter(x1,y2);hold on;plot(x1,y2);title('拉格朗日插值');
subplot(2,2,3);scatter(x1,y3);hold on;plot(x1,y3);title('牛顿插值');
subplot(2,2,4);scatter(x1,y4);hold on;plot(x1,y4);title('三样条插值');%画图显示