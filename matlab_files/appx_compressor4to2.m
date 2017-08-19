function [c,s] = appx_compressor4to2(a,b,c,d)

[c1,s1]=appx_compressor3to2(a,b,c);

c1_shifted=[c1 0];
s1_padded=[0 s1];
d_padded=[0 d];

[c,s]=appx_compressor3to2(c1_shifted,s1_padded,d_padded);

end



