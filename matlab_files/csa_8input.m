function out= csa_8input(a,b,c,d,e,f,g,h,var)

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

[c1,s1]=compressor8to2(a,b,c,d,e,f,g,h,var);

c1_shifted=[0 c1];
s1_padded=[s1 s1(end)];

[out]=rca(c1_shifted,s1_padded,var);

end