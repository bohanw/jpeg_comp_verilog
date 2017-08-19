function [c,s] = appx_compressor3to2(a,b,c)
len=length(a);
for i = 1:len
        [c(i),s(i)]=appx_fa(a(i),b(i),c(i));
end


