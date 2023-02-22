clc;clear;
coef1=[2,2,3;4,7,7;-2,4,5];
coef2=[2,1,2;4,3,1;6,1,5];
coef3=[2,2,3,4;2,4,9,16;4,8,24,64;6,16,51,100];
coef4=[1,1,-1;1,2,-2;-2,1,1];coef44=[1;0;0];
coef55=[0;1;0];coef66=[0;0;1];%输入数据

[a,b]=doolittle(coef1);
[c,d]=crout(coef2);
[e,f]=doolittle(coef3);
[g]=solve(coef4,coef44);
[h]=solve(coef4,coef55);
[i]=solve(coef4,coef66);%调用函数

disp('对A使用杜特利尔分解可得：');disp([a,b]);
disp('对B使用克洛特分解可得：');disp([c,d]);
disp('对C使用杜利特尔分解可得：');disp([e,f]);
disp('对1）求根可得：');disp(g);
disp('对2）求根可得：');disp(h);
disp('对3）求根可得：');disp(i);%显示结果

function [fx]=solve(coef1,coef2)
    [r,c]=size(coef1);%测量矩阵大小
    [l,u]=doolittle(coef1);%调用doolittle函数
    y=zeros(r,1);%创建中间矩阵
    for i=1:r
       temp=0;
       for j=1:i
           temp=temp+l(i,j)*y(j,1);%循环叠加
       end
       y(i,1)=coef2(i,1)-temp;%求对应中间矩阵值
    end
    fx(r,1)=y(r,1)/u(r,c);%求解解矩阵
    for i=r-1:-1:1
        temp=0;
       for j=i+1:r
           temp=temp+u(i,j)*fx(j,1);%对应求解
       end
       fx(i,1)=(y(i,1)-temp)/u(i,i);
    end
end

function [l,u]=crout(coef)
    [r,c]=size(coef);%测量矩阵大小
    for i=1:r
       l(i,1)=coef(i,1); %确定L矩阵第一列
    end
    u(1,1)=1;
    for i=2:c
       u(1,i)=coef(1,i)/coef(1,1); %确定U矩阵第一行
    end
    for i=2:r
       for j=i:c
           temp=0;
           for k=1:i-1
              temp=temp+l(j,k)*u(k,i); 
           end
           l(j,i)=coef(j,i)-temp;%先确定L矩阵的值
           temp1=0;
           for p=1:i-1
              temp1=temp1+l(i,p)*u(p,j); 
           end
           u(i,j)=(coef(i,j)-temp1)/l(i,i);%确定U矩阵对应值
       end
    end
end

function [l,u]=doolittle(coef)
    [r,c]=size(coef);%确定矩阵尺寸
    for i=1:c
        u(1,i)=coef(1,i);%确定U矩阵第一行
    end
    l(1,1)=1;
    for i=2:r
       l(i,1)=coef(i,1)/coef(1,1); %确定L矩阵第一列
    end
    for i = 2:r
        for j = i:c
            temp = 0;
            for k = 1:i-1
                temp = temp + l(i,k)*u(k,j);
            end
            u(i,j) = coef(i,j) - temp;%求U矩阵对应值
            temp1 = 0;
            for p = 1:i-1
                temp1 = temp1 + l(j,p)*u(p,i);
            end 
            l(j,i) = (coef(j,i) - temp1)/u(i,i);%求对应U矩阵的L矩阵的值
        end
    end
end 