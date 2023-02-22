function r = xianxing(x,y,a)
n = length(x);
m = length(y);%得知数据长度
for i = 2:n
    if a < x(i)
        z = i;%取最近的大于a的值
        break;
    end
end
b = (y(z) - y (z-1))/(x(z)-x(z-1));
r = y(z-1) + b*(a-x(z-1));%近似计算
end