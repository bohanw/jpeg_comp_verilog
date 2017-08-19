function [c,s] = compressor4to2(a,b,c,d,var)


[c1,s1]=compressor3to2(a,b,c,var);
    

c1_shifted=[c1 0];
s1_padded=[0 s1];
d_padded=[0 d];
[c,s]=compressor3to2(c1_shifted,s1_padded,d_padded,var);

end



