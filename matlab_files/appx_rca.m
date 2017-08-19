function [c,s] = rca(a,b,var)
len=length(a);
for i = 1:len
    if i==1
        if var==
        [c(i),s(i)]=appx_fa(a(i),b(i),0);
    else
        [c(i),s(i)]=appx_fa(a(i),b(i),c(i-1));
    end
end
end


