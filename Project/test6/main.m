coef=[100,121,144];
coef1=[10,11,12];
coef2=[1,2,3,4,5];
coef3=[0,-5,-6,3,4];
coef4=[0.55,0.65];
coef44=[0.57815,0.69675];
coef5=[0.4,0.55,0.65];
coef55=[0.41075,0.57815,0.69675];
coef6=[0.4,0.55,0.65,0.8];
coef66=[0.41075,0.57815,0.69675,0.88811];%输入数据

a=xianxing(coef,coef1,115);
b=twoint(coef,coef1,115);
c=lagrange(coef2,coef3,1.33333);
d=newton(coef4,coef44,0.596);
e=newton(coef5,coef55,0.596);
f=newton(coef6,coef66,0.596);%调用函数
