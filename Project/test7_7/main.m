clc;clear;
x=[0,3,5,7,9,11,12,13,14,15];
y=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6];%����ԭʼ����

x1=0:0.5:15;
y1=interp1(x,y,x1,'spline');%��ƻ�����������
y2=lagrange(x,y,x1);
y3=newton(x,y,x1);
y4=interp1(x,y,x1,'spline');%���ö�Ӧ�������м������

subplot(2,2,1);scatter(x1,y1);hold on;plot(x1,y1);title("������������");
subplot(2,2,2);scatter(x1,y2);hold on;plot(x1,y2);title('�������ղ�ֵ');
subplot(2,2,3);scatter(x1,y3);hold on;plot(x1,y3);title('ţ�ٲ�ֵ');
subplot(2,2,4);scatter(x1,y4);hold on;plot(x1,y4);title('��������ֵ');%��ͼ��ʾ