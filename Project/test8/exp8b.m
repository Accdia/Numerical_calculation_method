%2 最小二乘拟合多项式
clc;clear;
x=[0.0,0.25,0.50,0.75,1.00];
y=[1.0000,1.2840,1.6487,2.1170,2.7183];%输入数据

n=length(x);%取长度
sx=sum(x);%对x数组求和
sx2=sum(x.*x);%对x数组平方求和
sx3=sum(x.*x.*x);%对x数组立方求和
sx4=sum(x.*x.*x.*x);%对x数组4次方求和

sy=sum(y);%对y求和
sxy=sum(x.*y);%对x数组乘上y数组后求和
sx2y=sum(x.*x.*y);%对x数组平方后乘上y数组后求和

Z=[n sx sx2;sx sx2 sx3;sx2 sx3 sx4]\[sy;sxy;sx2y];%求对应矩阵

a0=Z(1);a1=Z(2);a2=Z(3);
y=a0+a1*x+a2*x.*x;%求方程式

plot(x,y,'o',x,y,'-');title('二次拟合');
fprintf('拟合曲线为y=%1f+%1fx+%1fx^2\n',a0,a1,a2);%显示数据