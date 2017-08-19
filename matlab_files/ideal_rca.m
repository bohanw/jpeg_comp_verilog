function [c,s] = ideal_rca(a,b)
len=length(a);
for i = 1:len
    if i==1
        [c(i),s(i)]=ideal_fa(a(i),b(i),0);
    else
        [c(i),s(i)]=ideal_fa(a(i),b(i),c(i-1));
    end
end
end

