x1=3.100;a1=3.000;
x2=310.0;a2=300.0;
c1=x1-a1;c2=(x2-a2)/x1;
b1=x2-a2;b2=(x2-a2)/x2;
fprintf("%d,%d,%d,%d\n",b1,b2,c1,c2);

x=0.0235;fprintf("%d ",x);
for i=1:5
    x=i^2*x;
    fprintf("%d ",x);
end
fprintf("\n");
y=338.4;fprintf("%d ",y);
for i=5:-1:1
    y=y/(i^2);
    fprintf("%d ",y);
end
fprintf("\n");

coefficient1=[1 0 3 0 -2 6];coefficient2=[3 -1 2 0 1];
for i=1.1:0.1:1.3
fprintf("%d ",qing(coefficient1,i));
end
fprintf("\n");
for i=2:4
fprintf("%d ",qing(coefficient2,i));
end
fprintf("\n");
function fx=qing(coefficient,x)
fx=coefficient(1);
for i=1:length(coefficient)-1
fx=fx*x+coefficient(i+1);
end
end