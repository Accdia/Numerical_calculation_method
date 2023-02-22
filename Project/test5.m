clc;clear;
coef1=[2,2,3;4,7,7;-2,4,5];
coef2=[2,1,2;4,3,1;6,1,5];
coef3=[2,2,3,4;2,4,9,16;4,8,24,64;6,16,51,100];
coef4=[1,1,-1;1,2,-2;-2,1,1];coef44=[1;0;0];
coef55=[0;1;0];coef66=[0;0;1];%��������

[a,b]=doolittle(coef1);
[c,d]=crout(coef2);
[e,f]=doolittle(coef3);
[g]=solve(coef4,coef44);
[h]=solve(coef4,coef55);
[i]=solve(coef4,coef66);%���ú���

disp('��Aʹ�ö��������ֽ�ɵã�');disp([a,b]);
disp('��Bʹ�ÿ����طֽ�ɵã�');disp([c,d]);
disp('��Cʹ�ö����ض��ֽ�ɵã�');disp([e,f]);
disp('��1������ɵã�');disp(g);
disp('��2������ɵã�');disp(h);
disp('��3������ɵã�');disp(i);%��ʾ���

function [fx]=solve(coef1,coef2)
    [r,c]=size(coef1);%���������С
    [l,u]=doolittle(coef1);%����doolittle����
    y=zeros(r,1);%�����м����
    for i=1:r
       temp=0;
       for j=1:i
           temp=temp+l(i,j)*y(j,1);%ѭ������
       end
       y(i,1)=coef2(i,1)-temp;%���Ӧ�м����ֵ
    end
    fx(r,1)=y(r,1)/u(r,c);%�������
    for i=r-1:-1:1
        temp=0;
       for j=i+1:r
           temp=temp+u(i,j)*fx(j,1);%��Ӧ���
       end
       fx(i,1)=(y(i,1)-temp)/u(i,i);
    end
end

function [l,u]=crout(coef)
    [r,c]=size(coef);%���������С
    for i=1:r
       l(i,1)=coef(i,1); %ȷ��L�����һ��
    end
    u(1,1)=1;
    for i=2:c
       u(1,i)=coef(1,i)/coef(1,1); %ȷ��U�����һ��
    end
    for i=2:r
       for j=i:c
           temp=0;
           for k=1:i-1
              temp=temp+l(j,k)*u(k,i); 
           end
           l(j,i)=coef(j,i)-temp;%��ȷ��L�����ֵ
           temp1=0;
           for p=1:i-1
              temp1=temp1+l(i,p)*u(p,j); 
           end
           u(i,j)=(coef(i,j)-temp1)/l(i,i);%ȷ��U�����Ӧֵ
       end
    end
end

function [l,u]=doolittle(coef)
    [r,c]=size(coef);%ȷ������ߴ�
    for i=1:c
        u(1,i)=coef(1,i);%ȷ��U�����һ��
    end
    l(1,1)=1;
    for i=2:r
       l(i,1)=coef(i,1)/coef(1,1); %ȷ��L�����һ��
    end
    for i = 2:r
        for j = i:c
            temp = 0;
            for k = 1:i-1
                temp = temp + l(i,k)*u(k,j);
            end
            u(i,j) = coef(i,j) - temp;%��U�����Ӧֵ
            temp1 = 0;
            for p = 1:i-1
                temp1 = temp1 + l(j,p)*u(p,i);
            end 
            l(j,i) = (coef(j,i) - temp1)/u(i,i);%���ӦU�����L�����ֵ
        end
    end
end 