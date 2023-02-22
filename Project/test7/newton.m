function p= newton(xi,yi,x)
n=length(xi);
f=zeros(n,n);
% �Բ��̱��һ�и�ֵ
for k=1:n      
    f(k)=yi(k);
end
% ����̱�
for i=2:n       % ���̱��0�׿�ʼ�����Ǿ����Ǵ�1ά��ʼ�洢������������
    for k=i:n
        f(k,i)=(f(k,i-1)-f(k-1,i-1))/(xi(k)-xi(k+1-i));  
    end
end
%���ֵ����ʽ
p=0;          
for k=2:n
    t=1;
    for j=1:k-1
        t=t*(x-xi(j));
    end
    p=f(k,k)*t+p;
end
p=f(1,1)+p;
end