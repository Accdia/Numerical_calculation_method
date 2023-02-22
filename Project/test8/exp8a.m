clc;clear;
x=[10,20,30,40,50,60,70,80,90,100];
y=[62,68,75,81,89,95,102,108,115,122];%输入数据

n=length(x);%取长度
sx1=sum(x);%x求和
sx2=sum(x.*x);%x数组自乘后求和
sy=sum(y);%y求和
sxy=sum(x.*y);%x数组乘上y数组求和
Z=[n,sx1;sx1,sx2]\[sy;sxy];%求出对应数组

a=Z(1);b=Z(2);
y=a+b*x;%求得函数

plot(x,y,'o',x,y,'-');title('直线拟合')
fprintf('拟合直线为y=%1f+%1fx\n',a,b);%输出