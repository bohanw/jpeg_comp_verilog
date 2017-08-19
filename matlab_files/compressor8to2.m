function [cout,s] = compressor8to2(a,b,c,d,e,f,g,h,var)


[c1,s1]=compressor4to2(a,b,c,d,var);
    
c1_shifted=[0 c1];
s1_padded=[s1 s1(end)];

[c2,s2]=compressor4to2(e,f,g,h,var);
    
c2_shifted=[0 c2];
s2_padded=[s2 s2(end)];

[cout,s]=compressor4to2(c1_shifted,c2_shifted,s1_padded,s2_padded,var);

end





