function r = xianxing(x,y,a)
n = length(x);
m = length(y);%��֪���ݳ���
for i = 2:n
    if a < x(i)
        z = i;%ȡ����Ĵ���a��ֵ
        break;
    end
end
b = (y(z) - y (z-1))/(x(z)-x(z-1));
r = y(z-1) + b*(a-x(z-1));%���Ƽ���
end