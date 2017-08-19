%% Full error propagation experiment
clear;
QF=100; %between 1 and 100 , 100=> best quality, 1=> worst quality
apprx_bits_stage1=[0 0 0 0 0 0 0 0];
apprx_bits_stage2=[0 0 0 0 0 0 0 0];
x=zeros(8,8);
x(:,1)=1;
%NOTE 1D DCT of each row gives these same output
%hence just doing it once

[w1,w2,w3,w4,w5,w6,w7,w8]=ddct(x,apprx_bits_stage1);


w11=[w1
w1 
w1 
w1 
w1 
w1 
w1 
w1];
w22=[w2
w2 
w2 
w2 
w2 
w2 
w2 
w2];
w33=[w3
w3 
w3 
w3 
w3 
w3 
w3 
w3];
w44=[w4
w4 
w4 
w4 
w4 
w4 
w4 
w4];
w55=[w5
w5 
w5 
w5 
w5 
w5 
w5 
w5];
w66=[w6
w6 
w6 
w6 
w6 
w6 
w6 
w6];
w77=[w7
w7 
w7 
w7 
w7 
w7 
w7 
w7];
w88=[w8
w8 
w8 
w8 
w8 
w8 
w8 
w8];

%save('out_apprx.mat','w11','w22','w33','w44','w55','w66','w77','w88','apprx_bits','QF');
%clear
%load out_apprx.mat;
apprx_bits=apprx_bits_stage2;
[out11,out12,out13,out14,out15,out16,out17,out18]=ddct(w11,apprx_bits);
[out21,out22,out23,out24,out25,out26,out27,out28]=ddct(w22,apprx_bits);
[out31,out32,out33,out34,out35,out36,out37,out38]=ddct(w33,apprx_bits);
[out41,out42,out43,out44,out45,out46,out47,out48]=ddct(w44,apprx_bits);
[out51,out52,out53,out54,out55,out56,out57,out58]=ddct(w55,apprx_bits);
[out61,out62,out63,out64,out65,out66,out67,out68]=ddct(w66,apprx_bits);
[out71,out72,out73,out74,out75,out76,out77,out78]=ddct(w77,apprx_bits);
[out81,out82,out83,out84,out85,out86,out87,out88]=ddct(w88,apprx_bits);
clear w11 w22 w33 w44 w55 w66 w77 w88

%% dct with no apprx
apprx_bits=zeros(1,8);
%NOTE 1D DCT of each row gives these same output
%hence just doing it once
[w1,w2,w3,w4,w5,w6,w7,w8]=ddct(x,apprx_bits);


len_arr=[length(w1) length(w2) length(w3) length(w4) length(w5) length(w6) length(w7) length(w8)];
uniform_len=max(len_arr);
%doing sign extension and matching length
w1=[w1 w1(end)*ones(1,uniform_len-length(w1))];

w2=[w2 w2(end)*ones(1,uniform_len-length(w2))];

w3=[w3 w3(end)*ones(1,uniform_len-length(w3))];

w4=[w4 w4(end)*ones(1,uniform_len-length(w4))];

w5=[w5 w5(end)*ones(1,uniform_len-length(w5))];

w6=[w6 w6(end)*ones(1,uniform_len-length(w6))];

w7=[w7 w7(end)*ones(1,uniform_len-length(w7))];


w8=[w8 w8(end)*ones(1,uniform_len-length(w8))];



w11=[w1
w1 
w1 
w1 
w1 
w1 
w1 
w1];
w22=[w2
w2 
w2 
w2 
w2 
w2 
w2 
w2];
w33=[w3
w3 
w3 
w3 
w3 
w3 
w3 
w3];
w44=[w4
w4 
w4 
w4 
w4 
w4 
w4 
w4];
w55=[w5
w5 
w5 
w5 
w5 
w5 
w5 
w5];
w66=[w6
w6 
w6 
w6 
w6 
w6 
w6 
w6];
w77=[w7
w7 
w7 
w7 
w7 
w7 
w7 
w7];
w88=[w8
w8 
w8 
w8 
w8 
w8 
w8 
w8];


[out11_ideal,out12_ideal,out13_ideal,out14_ideal,out15_ideal,out16_ideal,out17_ideal,out18_ideal]=ddct(w11,apprx_bits);
[out21_ideal,out22_ideal,out23_ideal,out24_ideal,out25_ideal,out26_ideal,out27_ideal,out28_ideal]=ddct(w22,apprx_bits);
[out31_ideal,out32_ideal,out33_ideal,out34_ideal,out35_ideal,out36_ideal,out37_ideal,out38_ideal]=ddct(w33,apprx_bits);
[out41_ideal,out42_ideal,out43_ideal,out44_ideal,out45_ideal,out46_ideal,out47_ideal,out48_ideal]=ddct(w44,apprx_bits);
[out51_ideal,out52_ideal,out53_ideal,out54_ideal,out55_ideal,out56_ideal,out57_ideal,out58_ideal]=ddct(w55,apprx_bits);
[out61_ideal,out62_ideal,out63_ideal,out64_ideal,out65_ideal,out66_ideal,out67_ideal,out68_ideal]=ddct(w66,apprx_bits);
[out71_ideal,out72_ideal,out73_ideal,out74_ideal,out75_ideal,out76_ideal,out77_ideal,out78_ideal]=ddct(w77,apprx_bits);
[out81_ideal,out82_ideal,out83_ideal,out84_ideal,out85_ideal,out86_ideal,out87_ideal,out88_ideal]=ddct(w88,apprx_bits);

%% error matrix
err_out(:,1)=[weighted_sum(out11)-weighted_sum(out11_ideal),weighted_sum(out12)-weighted_sum(out12_ideal),weighted_sum(out13)-weighted_sum(out13_ideal),weighted_sum(out14)-weighted_sum(out14_ideal),weighted_sum(out15)-weighted_sum(out15_ideal),weighted_sum(out16)-weighted_sum(out16_ideal),weighted_sum(out17)-weighted_sum(out17_ideal),weighted_sum(out18)-weighted_sum(out18_ideal)];
err_out(:,2)=[weighted_sum(out21)-weighted_sum(out21_ideal),weighted_sum(out22)-weighted_sum(out22_ideal),weighted_sum(out23)-weighted_sum(out23_ideal),weighted_sum(out24)-weighted_sum(out24_ideal),weighted_sum(out25)-weighted_sum(out25_ideal),weighted_sum(out26)-weighted_sum(out26_ideal),weighted_sum(out27)-weighted_sum(out27_ideal),weighted_sum(out28)-weighted_sum(out28_ideal)];
err_out(:,3)=[weighted_sum(out31)-weighted_sum(out31_ideal),weighted_sum(out32)-weighted_sum(out32_ideal),weighted_sum(out33)-weighted_sum(out33_ideal),weighted_sum(out34)-weighted_sum(out34_ideal),weighted_sum(out35)-weighted_sum(out35_ideal),weighted_sum(out36)-weighted_sum(out36_ideal),weighted_sum(out37)-weighted_sum(out37_ideal),weighted_sum(out38)-weighted_sum(out38_ideal)];
err_out(:,4)=[weighted_sum(out41)-weighted_sum(out41_ideal),weighted_sum(out42)-weighted_sum(out42_ideal),weighted_sum(out43)-weighted_sum(out43_ideal),weighted_sum(out44)-weighted_sum(out44_ideal),weighted_sum(out45)-weighted_sum(out45_ideal),weighted_sum(out46)-weighted_sum(out46_ideal),weighted_sum(out47)-weighted_sum(out47_ideal),weighted_sum(out48)-weighted_sum(out48_ideal)];
err_out(:,5)=[weighted_sum(out51)-weighted_sum(out51_ideal),weighted_sum(out52)-weighted_sum(out52_ideal),weighted_sum(out53)-weighted_sum(out53_ideal),weighted_sum(out54)-weighted_sum(out54_ideal),weighted_sum(out55)-weighted_sum(out55_ideal),weighted_sum(out56)-weighted_sum(out56_ideal),weighted_sum(out57)-weighted_sum(out57_ideal),weighted_sum(out58)-weighted_sum(out58_ideal)];
err_out(:,6)=[weighted_sum(out61)-weighted_sum(out61_ideal),weighted_sum(out62)-weighted_sum(out62_ideal),weighted_sum(out63)-weighted_sum(out63_ideal),weighted_sum(out64)-weighted_sum(out64_ideal),weighted_sum(out65)-weighted_sum(out65_ideal),weighted_sum(out66)-weighted_sum(out66_ideal),weighted_sum(out67)-weighted_sum(out67_ideal),weighted_sum(out68)-weighted_sum(out68_ideal)];
err_out(:,7)=[weighted_sum(out71)-weighted_sum(out71_ideal),weighted_sum(out72)-weighted_sum(out72_ideal),weighted_sum(out73)-weighted_sum(out73_ideal),weighted_sum(out74)-weighted_sum(out74_ideal),weighted_sum(out75)-weighted_sum(out75_ideal),weighted_sum(out76)-weighted_sum(out76_ideal),weighted_sum(out77)-weighted_sum(out77_ideal),weighted_sum(out78)-weighted_sum(out78_ideal)];
err_out(:,8)=[weighted_sum(out81)-weighted_sum(out81_ideal),weighted_sum(out82)-weighted_sum(out82_ideal),weighted_sum(out83)-weighted_sum(out83_ideal),weighted_sum(out84)-weighted_sum(out84_ideal),weighted_sum(out85)-weighted_sum(out85_ideal),weighted_sum(out86)-weighted_sum(out86_ideal),weighted_sum(out87)-weighted_sum(out87_ideal),weighted_sum(out88)-weighted_sum(out88_ideal)];

if QF<=50 
    qf=QF/50;
else
    qf=50/(100-QF);
end
lumi_quant_int= [16 11 10 16 24 40 51 61
     12 12 14 19 26 58 60 55
     14 13 16 24 40 57 69 56
     14 17 22 29 51 87 80 62
     18 22 37 56 68 109 103 77
     24 35 55 64 81 104 113 92
     49 64 78 87 103 121 120 101 
     72 92 95 98 112 100 103 99];
 lumi_quant=round(lumi_quant_int./qf);

for i=1:64
     if lumi_quant(i)==0
        lumi_quant(i)=1;
     end
end

error_final=sum(sum(((abs(err_out))./lumi_quant)))
err_out./lumi_quant

