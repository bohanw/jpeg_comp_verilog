function out= csa_4input(a,b,c,d,var)

[c1,s1]=compressor4to2(a,b,c,d,var);

c1_shifted=[0 c1];
s1_padded=[s1 s1(end)];

[out]=rca(c1_shifted,s1_padded,var);

end