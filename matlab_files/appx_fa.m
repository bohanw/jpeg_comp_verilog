function [cout,s] = appx_fa(a,b,cin)
    cout=a*b+(1-a)*b*cin+(1-b)*a*cin;
    s=1-cout;
end