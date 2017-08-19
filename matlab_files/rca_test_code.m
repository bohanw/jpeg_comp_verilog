clear;
len=7;
a=0.5*ones(1,len);
b=0.5*ones(1,len);
ideal_s=rca(a,b,0);
appx_s=rca(a,b,5);
error=0;
for i=1:length(ideal_s)
error=error+(2^(i-1))*(appx_s(i)-ideal_s(i));
end
%error=error+(2^len)*(appx_c(i)-ideal_c(i));
error