[x1,x2]=zhubu(0);z=[x1,x2];
disp(['ͨ�����������������Ϊ(',num2str(z(1)),',',num2str(z(2)),')']);
disp(['ͨ�����ַ���ø�Ϊ',num2str(erfen(0,1))]);
disp(['ͨ����������ø�Ϊ',num2str(dieda(1.4))]);
%�𲽷�
function [left,right]=zhubu(a)
left=a;right=a+0.1;
while true
    fx1=left^3-left-1;
    fx2=right^3-right-1;
    if fx1*fx2<0
        break;
    else
        left=right;
        right=right+0.1;
    end 
end
end
%���ַ�
function [left,right]=erfen(a,b)
left=a;right=b;
while true
    middle=(left+right)/2;
    fx1=1-left-sin(left);
    fx2=1-right-sin(right);
    fx3=1-middle-sin(middle);
    if fx1*fx3>0
        left=middle;
    elseif fx2*fx3>0
        right=middle;
    end
    if right-left<0.00005
        break;
    end
end
end
%������
function fx=dieda(x)
fx=nthroot((x^2+1),3);
while true
    fxx=nthroot((fx^2+1),3);
    if fx==fxx
       break;
    else
        fx=fxx;
    end
end
end