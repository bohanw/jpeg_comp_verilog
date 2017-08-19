function out= special_csa_8input(a,b,c,d,e,f,g,h,var)
% this function does a+b+c+d+e+f+g+h+4

len_arr=[length(a) length(b) length(c) length(d) length(e) length(f) length(g) length(h)];

uniform_len=max(len_arr);
%doing sign extension and matching length
a=[a a(end)*ones(1,uniform_len-length(a))];
b=[b b(end)*ones(1,uniform_len-length(b))];
c=[c c(end)*ones(1,uniform_len-length(c))];
d=[d d(end)*ones(1,uniform_len-length(d))];
e=[e e(end)*ones(1,uniform_len-length(e))];
f=[f f(end)*ones(1,uniform_len-length(f))];
g=[g g(end)*ones(1,uniform_len-length(g))];
h=[h h(end)*ones(1,uniform_len-length(h))];
i=zeros(1,length(h));
i(3)=1; %%%making this number as four


%% Level 1
[c1,s1]=compressor3to2(a,b,c,var);
c1_shifted=[0 c1];
s1_padded=[s1 s1(end)];

[c2,s2]=compressor3to2(d,e,f,var);
c2_shifted=[0 c2];
s2_padded=[s2 s2(end)];

[c3,s3]=compressor3to2(g,h,i,var);
c3_shifted=[0 c3];
s3_padded=[s3 s3(end)];

%% Level 2
[c11,s11]=compressor3to2(c1_shifted,s1_padded,c2_shifted,var);
c11_shifted=[0 c11];
s11_padded=[s11 s11(end)];


[c22,s22]=compressor3to2(s2_padded,c3_shifted,s3_padded,var);
c22_shifted=[0 c22];
s22_padded=[s22 s22(end)];

%% Level 3
[c111,s111]=compressor4to2(c11_shifted,s11_padded,c22_shifted,s22_padded,var);
c111_shifted=[0 c111];
s111_padded=[s111 s111(end)];

%% Merge stage
[out]=rca(c111_shifted,s111_padded,var);



end