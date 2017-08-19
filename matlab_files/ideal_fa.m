function [cout,s] = fa(a,b,cin,var)
if var=='i'
    cout=a*b+b*cin+a*cin-2*a*b*cin;
    s=a*b*cin+(1-a)*(1-b)*cin+(1-a)*(1-cin)*b+(1-cin)*(1-b)*a;
else
    
end
