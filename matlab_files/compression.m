clear all;
close all;
total_loop_expt=0;
if (total_loop_expt==1)
    load apprx_control.mat;
else
    stage1_apprx=0;
    stage2_apprx=0;
end
QF=50; %between 1 and 100 , 100=> best quality, 1=> worst quality
use_matlab_dct=0;
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

%only for rtl purpose debug todo
%chromi_quant=lumi_quant;

%tiff_img_full=(im2double(imread('MARBLES.TIF')));
tiff_img_full=(im2double(imread('../../images/tomato.jpg')));


[x y z]=size(tiff_img_full);
x_max=(floor(x/8)*8);
y_max=(floor(y/8)*8);
%x_max=(32/8)*8;
%y_max=(32/8)*8;
tiff_img=tiff_img_full(1:x_max,1:y_max,:);

luminance_img=rgb2ycbcr(tiff_img);

%luminance_img=rgb2ycbcr_custom(tiff_img.*256); % use only for debug where input
%is only 1 8*8 block and it is 0 to 255 pixel input range

x_cord=1;
y_cord=1;

dc_y=0;
dc_cb=0;
dc_cr=0;

array_y=0;
array_cb=0;
array_cr=0;

for i=1:x_max/8
    for j=1 :y_max/8
        x_cord=(i-1)*8+1;
        y_cord=(j-1)*8+1;
        
        unit_matrix_y=luminance_img(x_cord:x_cord+7,y_cord:y_cord+7,1);
        unit_matrix_cb=luminance_img(x_cord:x_cord+7,y_cord:y_cord+7,2);
        unit_matrix_cr=luminance_img(x_cord:x_cord+7,y_cord:y_cord+7,3);
        
        ref_img_int(:,:,1)=unit_matrix_y;
        ref_img_int(:,:,2)=unit_matrix_cb;
        ref_img_int(:,:,3)=unit_matrix_cr;
  
        ref_img=ycbcr2rgb(ref_img_int);
        
        
       if (use_matlab_dct==0)
            %changing range of input to -128 to 127
            unit_matrix_final_y=((unit_matrix_y.*256)-128);
            unit_matrix_final_cb=((unit_matrix_cb.*256)-128);
            unit_matrix_final_cr=((unit_matrix_cr.*256)-128);



            %changing signed number to unsigned (this is only a format change)

            unit_matrix_final_y(unit_matrix_final_y<0)=unit_matrix_final_y(unit_matrix_final_y<0)+256;
            unit_matrix_final_cb(unit_matrix_final_cb<0)=unit_matrix_final_cb(unit_matrix_final_cb<0)+256;
            unit_matrix_final_cr(unit_matrix_final_cr<0)=unit_matrix_final_cr(unit_matrix_final_cr<0)+256;

            dct_y=dddct_taking_1block_in_decimal(unit_matrix_final_y,stage1_apprx,stage2_apprx);
            dct_cb=dddct_taking_1block_in_decimal(unit_matrix_final_cb,stage1_apprx,stage2_apprx);
            dct_cr=dddct_taking_1block_in_decimal(unit_matrix_final_cr,stage1_apprx,stage2_apprx);
            
        else
            
            
            dct_y=dct2(unit_matrix_y.*256);
            dct_cb=dct2(unit_matrix_cb.*256);
            dct_cr=dct2(unit_matrix_cr.*256);
            
       end
            dct_y=dct_y'; %needed because the dct used in matlab is transposing x and y
            dct_cb=dct_cb';
            dct_cr=dct_cr';




%         quantised_y(x_cord:x_cord+7,y_cord:y_cord+7)=round(dct_y./lumi_quant);
%         quantised_cb(x_cord:x_cord+7,y_cord:y_cord+7)=round(dct_cb./chromi_quant);
%         quantised_cr(x_cord:x_cord+7,y_cord:y_cord+7)=round(dct_cr./chromi_quant);

        quantised_y=round(dct_y./lumi_quant);
        quantised_cb=round(dct_cb./chromi_quant);
        quantised_cr=round(dct_cr./chromi_quant); 
        
               %zig-zaging and encoding
        
        dcpm_y=quantised_y(1,1)-dc_y;
        dcpm_cb=quantised_cb(1,1)-dc_cb;
        dcpm_cr=quantised_cr(1,1)-dc_cr;
        
        dc_y=quantised_y(1,1);
        dc_cb=quantised_cb(1,1);
        dc_cr=quantised_cr(1,1);
        
       
        
        quantised_y(1,1)=dcpm_y;
        qy=quantised_y;
        zz_y=[qy(1,1) qy(1,2) qy(2,1) qy(3,1) qy(2,2) qy(1,3) qy(1,4) qy(2,3) qy(3,2) qy(4,1) qy(5,1) qy(4,2) qy(3,3) qy(2,4) qy(1,5) qy(1,6) qy(2,5) qy(3,4) qy(4,3) qy(5,2) qy(6,1) qy(7,1) qy(6,2) qy(5,3) qy(4,4) qy(3,5) qy(2,6) qy(1,7) qy(1,8) qy(2,7) qy(3,6) qy(4,5) qy(5,4) qy(6,3) qy(7,2) qy(8,1) qy(8,2) qy(7,3) qy(6,4) qy(5,5) qy(4,6) qy(3,7) qy(2,8) qy(3,8) qy(4,7) qy(5,6) qy(6,5) qy(7,4) qy(8,3) qy(8,4) qy(7,5) qy(6,6) qy(5,7) qy(4,8) qy(5,8) qy(6,7) qy(7,6) qy(8,5) qy(8,6) qy(7,7) qy(6,8) qy(7,8) qy(8,7) qy(8,8)];
        if size(array_y)==1
            array_y=[dc_code(zz_y(1)) zz_y(1)];
        else
            array_y=[array_y dc_code(zz_y(1)) zz_y(1)];
        end

        zero_count=0;
        for k=2:length(zz_y)
            if zz_y(k)==0
                zero_count=zero_count+1;
                if ((zero_count==16) && (~isempty(zz_y(k+1:end)~=0))) % there are 16 zeros and atleast 1 non zero in the reminder of the block
                    array_y=[array_y 15 0];
                    zero_count=0;
                end
            else
                array_y=[array_y zero_count dc_code(zz_y(k)) zz_y(k)];
                zero_count=0;
            end
        end
        array_y=[array_y 0 0];

                
        quantised_cb(1,1)=dcpm_cb;
        qcb=quantised_cb;
        zz_cb=[qcb(1,1) qcb(1,2) qcb(2,1) qcb(3,1) qcb(2,2) qcb(1,3) qcb(1,4) qcb(2,3) qcb(3,2) qcb(4,1) qcb(5,1) qcb(4,2) qcb(3,3) qcb(2,4) qcb(1,5) qcb(1,6) qcb(2,5) qcb(3,4) qcb(4,3) qcb(5,2) qcb(6,1) qcb(7,1) qcb(6,2) qcb(5,3) qcb(4,4) qcb(3,5) qcb(2,6) qcb(1,7) qcb(1,8) qcb(2,7) qcb(3,6) qcb(4,5) qcb(5,4) qcb(6,3) qcb(7,2) qcb(8,1) qcb(8,2) qcb(7,3) qcb(6,4) qcb(5,5) qcb(4,6) qcb(3,7) qcb(2,8) qcb(3,8) qcb(4,7) qcb(5,6) qcb(6,5) qcb(7,4) qcb(8,3) qcb(8,4) qcb(7,5) qcb(6,6) qcb(5,7) qcb(4,8) qcb(5,8) qcb(6,7) qcb(7,6) qcb(8,5) qcb(8,6) qcb(7,7) qcb(6,8) qcb(7,8) qcb(8,7) qcb(8,8)];
        
        if size(array_cb)==1
            array_cb=[dc_code(zz_cb(1)) zz_cb(1)];
        else
            array_cb=[array_cb dc_code(zz_cb(1)) zz_cb(1)];
        end

        zero_count=0;
        for k=2:length(zz_cb)
            if zz_cb(k)==0
                zero_count=zero_count+1;
                if ((zero_count==16) && (~isempty(zz_cb(k+1:end)~=0))) % there are 16 zeros and atleast 1 non zero in the reminder of the block
                    array_cb=[array_cb 15 0];
                    zero_count=0;
                end
            else
                array_cb=[array_cb zero_count dc_code(zz_cb(k)) zz_cb(k)];
                zero_count=0;
            end
        end
        array_cb=[array_cb 0 0];           
        
        quantised_cr(1,1)=dcpm_cr;
        qcr=quantised_cr;
        zz_cr=[qcr(1,1) qcr(1,2) qcr(2,1) qcr(3,1) qcr(2,2) qcr(1,3) qcr(1,4) qcr(2,3) qcr(3,2) qcr(4,1) qcr(5,1) qcr(4,2) qcr(3,3) qcr(2,4) qcr(1,5) qcr(1,6) qcr(2,5) qcr(3,4) qcr(4,3) qcr(5,2) qcr(6,1) qcr(7,1) qcr(6,2) qcr(5,3) qcr(4,4) qcr(3,5) qcr(2,6) qcr(1,7) qcr(1,8) qcr(2,7) qcr(3,6) qcr(4,5) qcr(5,4) qcr(6,3) qcr(7,2) qcr(8,1) qcr(8,2) qcr(7,3) qcr(6,4) qcr(5,5) qcr(4,6) qcr(3,7) qcr(2,8) qcr(3,8) qcr(4,7) qcr(5,6) qcr(6,5) qcr(7,4) qcr(8,3) qcr(8,4) qcr(7,5) qcr(6,6) qcr(5,7) qcr(4,8) qcr(5,8) qcr(6,7) qcr(7,6) qcr(8,5) qcr(8,6) qcr(7,7) qcr(6,8) qcr(7,8) qcr(8,7) qcr(8,8)];
        
        if size(array_cr)==1
            array_cr=[dc_code(zz_cr(1)) zz_cr(1)];
        else
            array_cr=[array_cr dc_code(zz_cr(1)) zz_cr(1)];
        end

        zero_count=0;
        for k=2:length(zz_cr)
            if zz_cr(k)==0
                zero_count=zero_count+1;
                if ((zero_count==16) && (~isempty(zz_cr(k+1:end)~=0))) % there are 16 zeros and atleast 1 non zero in the reminder of the block
                    array_cr=[array_cr 15 0];
                    zero_count=0;
                end
            else
                array_cr=[array_cr zero_count dc_code(zz_cr(k)) zz_cr(k)];
                zero_count=0;
            end
        end
        array_cr=[array_cr 0 0];     
        
    end
end
savefile_ref = 'orig_image.mat';
save(savefile_ref,'tiff_img');
savefile= 'compressed.mat';
save(savefile, 'array_y', 'array_cb', 'array_cr','lumi_quant','chromi_quant','x_max','y_max','QF','use_matlab_dct');

   


     