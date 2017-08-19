function [cout,s] = compressor4to2(a,b,c,d,var)


[c1,s1]=compressor3to2(a,b,c,var);
    
c1_shifted=[0 c1];
s1_padded=[s1 s1(end)];
d_padded=[d d(end)];
[cout,s]=compressor3to2(c1_shifted,s1_padded,d_padded,var);
    

end





