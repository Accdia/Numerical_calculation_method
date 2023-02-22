function r = twoint( x,y,a )
n = length(x);
m = length(y);%获取数据长度
for i = 2:n
    if a < x(i)
        z = i;%获取接近所需值
        break;
    end
end
if z==2
    k =3;
else
    k =4;
end
if z~=2 && z~=6
  p = x(z+1)-a;
  q = x(z-2)-a;
   if abs(p)<abs(q)%绝对值判断
    k = z+1;
   else
    k = z-2;
   end
end
b = (y(z) - y (z-1))/(x(z)-x(z-1));
c = (y(k) - y(z))/(x(k)-x(z));
d = (c-b)/(x(k)-x(z-1));%差商计算
r = y(z-1) + b*(a-x(z-1)) + d*(a-x(z-1))*(a-x(z));
end