%% 1 D DCT 
function [w1,w2,w3,w4,w5,w6,w7,w8]=ddct(x,var)
a=64;
b=60;
c=56;
d=45;
e=36;
f=24;
g=12;

w1=csa_8input(mul(x(1,:),d,var(1)),mul(x(2,:),d,var(1)),mul(x(3,:),d,var(1)),mul(x(4,:),d,var(1)),mul(x(5,:),d,var(1)),mul(x(6,:),d,var(1)),mul(x(7,:),d,var(1)),mul(x(8,:),d,var(1)),var(1));
w2=special_csa_8input(mul(x(1,:),a,var(2)),mul(x(2,:),c,var(2)),mul(x(3,:),e,var(2)),mul(x(4,:),g,var(2)),1-mul(x(5,:),g,var(2)),1-mul(x(6,:),e,var(2)),1-mul(x(7,:),c,var(2)),1-mul(x(8,:),a,var(2)),var(2));
w3=special_csa_8input(mul(x(1,:),b,var(3)),mul(x(2,:),f,var(3)),1-mul(x(3,:),f,var(3)),1-mul(x(4,:),b,var(3)),1-mul(x(5,:),b,var(3)),1-mul(x(6,:),f,var(3)),mul(x(7,:),f,var(3)),mul(x(8,:),b,var(3)),var(3));
w4=special_csa_8input(mul(x(1,:),c,var(4)),1-mul(x(2,:),g,var(4)),1-mul(x(3,:),a,var(4)),1-mul(x(4,:),e,var(4)),mul(x(5,:),e,var(4)),mul(x(6,:),a,var(4)),mul(x(7,:),g,var(4)),1-mul(x(8,:),c,var(4)),var(4));
w5=special_csa_8input(mul(x(1,:),d,var(5)),1-mul(x(2,:),d,var(5)),1-mul(x(3,:),d,var(5)),mul(x(4,:),d,var(5)),mul(x(5,:),d,var(5)),1-mul(x(6,:),d,var(5)),1-mul(x(7,:),d,var(5)),mul(x(8,:),d,var(5)),var(5));
w6=special_csa_8input(mul(x(1,:),e,var(6)),1-mul(x(2,:),a,var(6)),mul(x(3,:),g,var(6)),mul(x(4,:),c,var(6)),1-mul(x(5,:),c,var(6)),1-mul(x(6,:),g,var(6)),mul(x(7,:),a,var(6)),1-mul(x(8,:),e,var(6)),var(6));
w7=special_csa_8input(mul(x(1,:),f,var(7)),1-mul(x(2,:),b,var(7)),mul(x(3,:),b,var(7)),1-mul(x(4,:),f,var(7)),1-mul(x(5,:),f,var(7)),1-mul(x(6,:),b,var(7)),mul(x(7,:),b,var(7)),mul(x(8,:),f,var(7)),var(7));
w8=special_csa_8input(mul(x(1,:),g,var(8)),1-mul(x(2,:),e,var(8)),mul(x(3,:),c,var(8)),1-mul(x(4,:),a,var(8)),mul(x(5,:),a,var(8)),1-mul(x(6,:),c,var(8)),mul(x(7,:),e,var(8)),1-mul(x(8,:),g,var(8)),var(8));

%% dividing by 2^7

w1=w1(8:end); 
w2=w2(8:end);
w3=w3(8:end);
w4=w4(8:end);
w5=w5(8:end);
w6=w6(8:end);
w7=w7(8:end);
w8=w8(8:end);

len_arr=[length(w1) length(w2) length(w3) length(w4) length(w5) length(w6) length(w7) length(w8)];
uniform_len=max(len_arr);
%doing sign extension and matching length
w1=[w1 w1(end)*ones(1,uniform_len-length(w1))];

w2=[w2 w2(end)*ones(1,uniform_len-length(w2))];
;
w3=[w3 w3(end)*ones(1,uniform_len-length(w3))];

w4=[w4 w4(end)*ones(1,uniform_len-length(w4))];

w5=[w5 w5(end)*ones(1,uniform_len-length(w5))];
;
w6=[w6 w6(end)*ones(1,uniform_len-length(w6))];

w7=[w7 w7(end)*ones(1,uniform_len-length(w7))];

w8=[w8 w8(end)*ones(1,uniform_len-length(w8))];




end