clear all;
close all;
load compressed.mat; %loading all spec from compression matlab model
control='apr'; % specify 'rtl' for behav sims , 'syn' for post-syn sims, 'apr' for post-apr sims

    



%% getting exact lumi quant coeff used in RTL
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

chromi_quant_int= [17 18 24 47 99 99 99 99 
                18 21 26 66 99 99 99 99 
                24 26 56 99 99 99 99 99 
                47 66 99 99 99 99 99 99 
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99
                99 99 99 99 99 99 99 99 
                99 99 99 99 99 99 99 99];
            lumi_quant=round(lumi_quant_int./qf);

chromi_quant=round(chromi_quant_int./qf);
for i=1:64
    if chromi_quant(i)==0
        chromi_quant(i)=1;
    end
     if lumi_quant(i)==0
        lumi_quant(i)=1;
     end
end

chromi_mult=1./chromi_quant;
right_shift=10;
chromi_final=round(chromi_mult*(2^right_shift),0);
actual_division_chromi=1./(chromi_final/(2^right_shift));
ideal_division_chromi=chromi_quant;

lumi_mult=1./lumi_quant;
right_shift=10;
lumi_final=round(lumi_mult*(2^right_shift),0);
actual_division_lumi=1./(lumi_final/(2^right_shift));
ideal_division_lumi=lumi_quant;


%% loading simulation output (compressed binary stream)
if isequal(control,'rtl')
    y_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_sim/y_compressed.txt');
    cb_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_sim/cb_compressed.txt');
    cr_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_sim/cr_compressed.txt');
elseif isequal(control,'syn')
    y_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn_sim/y_compressed.txt');
    cb_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn_sim/cb_compressed.txt');
    cr_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn_sim/cr_compressed.txt');
else
    y_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_apr_sim/y_compressed.txt');
    cb_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_apr_sim/cb_compressed.txt');
    cr_compressed=load('/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_apr_sim/cr_compressed.txt');    
end


%% huffman decoding to a format that decompression.m will understand
array_y=huffman_decode(y_compressed); %% don't change array_y, array_cb, array_cr names
array_cb=huffman_decode(cb_compressed);
array_cr=huffman_decode(cr_compressed);


savefile= 'compressed_rtl.mat';
lumi_quant=actual_division_lumi;
chromi_quant=lumi_quant; % this is because currently in rtl all quantisation coeff are lumi quant only
save(savefile, 'array_y', 'array_cb', 'array_cr','lumi_quant','chromi_quant','x_max','y_max','QF','use_matlab_dct');

