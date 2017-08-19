function output = dddct_taking_1block_in_decimal(input,stage1_apprx,stage2_apprx)
% input is 8*8 1block input and it is expected in the range 
apprx_bits_stage1=stage1_apprx*ones(1,8);
apprx_bits_stage2=stage2_apprx*ones(1,8);


img_block_in=input;
 [l,b]=size(img_block_in);
 for i=1:l
     for j=1:b
         temp=dec2bin(img_block_in(i,j),8);
         for var=1:8
             bin_img(i,j,var)=str2num(temp(9-var));
         end
     end
 end
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
    %clear w1 w2 w3 w4 w5 w6 w7 w8
end
%% transpose
for i=1:8
    for j=1:8
        dct_stage2_inp(i,j,:)=dct_stage1(j,i,:);
    end
end
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

output=final_output_matrix';
end
