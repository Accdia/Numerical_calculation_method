%Lagrange��ֵ����
function y=lagrange(x0,y0,x)
n=length(x0);
m=length(y0);%ȡ�������С
s=0.0;
for k=1:n
     t=ones(1,length(x));
    for j=1:n
        if j~=k
            t=t.*(x-x0(j))/(x0(k)-x0(j));%���lk(x)
        end
    end
    s=t*y0(k)+s;
end
y=s;
end