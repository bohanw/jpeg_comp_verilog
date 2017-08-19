close all;
clear all;
apprx_bits_stage1=[0 0 0 0 0 0 0 0];
apprx_bits_stage2=[0 0 0 0 0 0 0 0];

%% input image from testbench pre-processing
%img_block_in=load('../jpeg_verilog/trunk/dct_bohan/matrix.in');
%img_block_in=2*ones(8,8);
 [l,b]=size(img_block_in);
 for i=1:l
     for j=1:b
         temp=dec2bin(img_block_in(i,j),8);
         for var=1:8
             bin_img(i,j,var)=str2num(temp(9-var));
         end
     end
 end
 fid1 = print2file(bin_img,'/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/trunk/dct_bohan_0206/in.txt');

%% 1-D DCT on each column | DCT stage 1
for i=1:8
    
    [w1,w2,w3,w4,w5,w6,w7,w8]=ddct(bin_img(1:8,i,:),apprx_bits_stage1);
    dct_stage1(1:8,i,:)=[w1
        w2
        w3
        w4
        w5
        w6
        w7
        w8];
    clear w1 w2 w3 w4 w5 w6 w7 w8
end
fid2 = print2file(dct_stage1,'/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/trunk/dct_bohan_0206/tran_in_m.txt');

%% transpose
for i=1:8
    for j=1:8
        dct_stage2_inp(i,j,:)=dct_stage1(j,i,:);
    end
end
fid3 = print2file(dct_stage2_inp,'/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/trunk/dct_bohan_0206/tran_out_m.txt');

%% 1-D DCT on each column | DCT stage 2
for i=1:8
    
    [w1,w2,w3,w4,w5,w6,w7,w8]=ddct(dct_stage2_inp(1:8,i,:),apprx_bits_stage2);
    dct_stage2(1:8,i,:)=[w1
        w2
        w3
        w4
        w5
        w6
        w7
        w8];
    clear w1 w2 w3 w4 w5 w6 w7 w8
end

%% converting dct output to 2's complement decimal and printing the matrix

for i=1:8
    for j=1:8
        final_output_matrix(i,j)=weighted_sum(dct_stage2(i,j,:));
    end
end

final_output_matrix
