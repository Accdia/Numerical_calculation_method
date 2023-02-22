function y=lagrange(x0,y0,x)
ii=1:length(x0);%获取长度
y=zeros(size(x));%创建输出
    for i=ii
        ij=find(ii~=i);%找出满足条件的值
        y1=1;
        for j=1:length(ij)
            y1=y1.*(x-x0(ij(j)));%计算差商
        end
        y=y+y1*y0(i)/prod(x0(i)-x0(ij));%计算输出值
    end
end
