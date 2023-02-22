clc,clear;
coef=[0,3,5,7,9,11,12,13,14,15];
coef1=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.4,1.6];
% coef2=zeros(1,coef(length(coef))*2);
% coef3=zeros(1,coef(length(coef))*2);
for i=1:coef(length(coef))*2
   for l=1:length(coef)
      if i==coef(l)
          i=i+1;
          break;
      end
      a=lagrange(coef,coef1,i/2);
      coef=insert(coef,i+1,i/2);
      coef1=insert(coef1,i+1,a);
   end
end