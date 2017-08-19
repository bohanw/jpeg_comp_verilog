function [c,s] = ideal_compressor3to2(a,b,c)
len=length(a);
for i = 1:len
        [c(i),s(i)]=ideal_fa(a(i),b(i),c(i));
end


