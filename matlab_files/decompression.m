clear all;
close all;

use_rtl_compressed_data=0; %% configure this is as 1 => RTL compression output used, 0=> MATLAB compression output used 

if (use_rtl_compressed_data==1)
    load compressed_rtl.mat;
else
    load compressed.mat;
end
load orig_image.mat;

EOB=1;
dc_old=0;
i=1;
while i<=length(array_y)

    
    if EOB==1 % DC detection and decode from DPCM
        if i==1
            zz_y=array_y(i+1)+dc_old;
        else
            zz_y=[zz_y array_y(i+1)+dc_old];
        end
        i=i+2;
        dc_old=zz_y(end);
        EOB=0;
        continue;
    end
    if array_y(i)==0 && array_y(i+1)==0 %EOB detection
        if rem(length(zz_y),64)~=0
            zz_y=[zz_y zeros(1,64-rem(length(zz_y),64))];
        end
        EOB=1;
        i=i+2;
        continue;
    end
    if array_y(i)==15 && array_y(i+1)==0 % 16 continuous zeros detection
        zz_y=[zz_y zeros(1,16)];
        i=i+2;
        continue;
    end
    zz_y=[zz_y zeros(1,array_y(i)) array_y(i+2)]; %normal ac detection
    i=i+3;
    
end


EOB=1;
dc_old=0;
i=1;
while i<=length(array_cb)
    if EOB==1 % DC detection and decode from DPCM
        if i==1
            zz_cb=array_cb(i+1)+dc_old;
        else
            zz_cb=[zz_cb array_cb(i+1)+dc_old];
        end
        i=i+2;
        dc_old=zz_cb(end);
        EOB=0;

        continue;
    end
    if array_cb(i)==0 && array_cb(i+1)==0 %EOB detection
        zz_cb=[zz_cb zeros(1,64-rem(length(zz_cb),64))];
        EOB=1;
        i=i+2;
        continue;
    end
    if array_cb(i)==15 && array_cb(i+1)==0 % 16 continuous zeros detection
        zz_cb=[zz_cb zeros(1,16)];
        i=i+2;
        continue;
    end
    zz_cb=[zz_cb zeros(1,array_cb(i)) array_cb(i+2)]; %normal ac detection
    i=i+3;
end

EOB=1;
dc_old=0;
i=1;
while i<=length(array_cr)
    if EOB==1 % DC detection and decode from DPCM
        if i==1
            zz_cr=array_cr(i+1)+dc_old;
        else
            zz_cr=[zz_cr array_cr(i+1)+dc_old];
        end
        i=i+2;
        dc_old=zz_cr(end);
        EOB=0;

        continue;
    end
    if array_cr(i)==0 && array_cr(i+1)==0 %EOB detection
        zz_cr=[zz_cr zeros(1,64-rem(length(zz_cr),64))];
        EOB=1;
        i=i+2;
        continue;
    end
    if array_cr(i)==15 && array_cr(i+1)==0 % 16 continuous zeros detection
        zz_cr=[zz_cr zeros(1,16)];
        i=i+2;
        continue;
    end
    zz_cr=[zz_cr zeros(1,array_cr(i)) array_cr(i+2)]; %normal ac detection
    
    i=i+3;
end

m=0;
for i=1:x_max/8
    for j=1:y_max/8
        x_cord=(i-1)*8+1;
        y_cord=(j-1)*8+1;
        
        quantised_y(x_cord:x_cord+7,y_cord:y_cord+7)=[
            zz_y(m+1) zz_y(m+2) zz_y(m+6) zz_y(m+7) zz_y(m+15) zz_y(m+16) zz_y(m+28) zz_y(m+29)
            zz_y(m+3) zz_y(m+5) zz_y(m+8) zz_y(m+14) zz_y(m+17) zz_y(m+27) zz_y(m+30) zz_y(m+43)
            zz_y(m+4) zz_y(m+9) zz_y(m+13) zz_y(m+18) zz_y(m+26) zz_y(m+31) zz_y(m+42) zz_y(m+44)
            zz_y(m+10) zz_y(m+12) zz_y(m+19) zz_y(m+25) zz_y(m+32) zz_y(m+41) zz_y(m+45) zz_y(m+54)
            zz_y(m+11) zz_y(m+20) zz_y(m+24) zz_y(m+33) zz_y(m+40) zz_y(m+46) zz_y(m+53) zz_y(m+55)
            zz_y(m+21) zz_y(m+23) zz_y(m+34) zz_y(m+39) zz_y(m+47) zz_y(m+52) zz_y(m+56) zz_y(m+61)
            zz_y(m+22) zz_y(m+35) zz_y(m+38) zz_y(m+48) zz_y(m+51) zz_y(m+57) zz_y(m+60) zz_y(m+62)
            zz_y(m+36) zz_y(m+37) zz_y(m+49) zz_y(m+50) zz_y(m+58) zz_y(m+59) zz_y(m+63) zz_y(m+64)];
        
        quantised_cb(x_cord:x_cord+7,y_cord:y_cord+7)=[
            zz_cb(m+1) zz_cb(m+2) zz_cb(m+6) zz_cb(m+7) zz_cb(m+15) zz_cb(m+16) zz_cb(m+28) zz_cb(m+29)
            zz_cb(m+3) zz_cb(m+5) zz_cb(m+8) zz_cb(m+14) zz_cb(m+17) zz_cb(m+27) zz_cb(m+30) zz_cb(m+43)
            zz_cb(m+4) zz_cb(m+9) zz_cb(m+13) zz_cb(m+18) zz_cb(m+26) zz_cb(m+31) zz_cb(m+42) zz_cb(m+44)
            zz_cb(m+10) zz_cb(m+12) zz_cb(m+19) zz_cb(m+25) zz_cb(m+32) zz_cb(m+41) zz_cb(m+45) zz_cb(m+54)
            zz_cb(m+11) zz_cb(m+20) zz_cb(m+24) zz_cb(m+33) zz_cb(m+40) zz_cb(m+46) zz_cb(m+53) zz_cb(m+55)
            zz_cb(m+21) zz_cb(m+23) zz_cb(m+34) zz_cb(m+39) zz_cb(m+47) zz_cb(m+52) zz_cb(m+56) zz_cb(m+61)
            zz_cb(m+22) zz_cb(m+35) zz_cb(m+38) zz_cb(m+48) zz_cb(m+51) zz_cb(m+57) zz_cb(m+60) zz_cb(m+62)
            zz_cb(m+36) zz_cb(m+37) zz_cb(m+49) zz_cb(m+50) zz_cb(m+58) zz_cb(m+59) zz_cb(m+63) zz_cb(m+64)];
        
        quantised_cr(x_cord:x_cord+7,y_cord:y_cord+7)=[
            zz_cr(m+1) zz_cr(m+2) zz_cr(m+6) zz_cr(m+7) zz_cr(m+15) zz_cr(m+16) zz_cr(m+28) zz_cr(m+29)
            zz_cr(m+3) zz_cr(m+5) zz_cr(m+8) zz_cr(m+14) zz_cr(m+17) zz_cr(m+27) zz_cr(m+30) zz_cr(m+43)
            zz_cr(m+4) zz_cr(m+9) zz_cr(m+13) zz_cr(m+18) zz_cr(m+26) zz_cr(m+31) zz_cr(m+42) zz_cr(m+44)
            zz_cr(m+10) zz_cr(m+12) zz_cr(m+19) zz_cr(m+25) zz_cr(m+32) zz_cr(m+41) zz_cr(m+45) zz_cr(m+54)
            zz_cr(m+11) zz_cr(m+20) zz_cr(m+24) zz_cr(m+33) zz_cr(m+40) zz_cr(m+46) zz_cr(m+53) zz_cr(m+55)
            zz_cr(m+21) zz_cr(m+23) zz_cr(m+34) zz_cr(m+39) zz_cr(m+47) zz_cr(m+52) zz_cr(m+56) zz_cr(m+61)
            zz_cr(m+22) zz_cr(m+35) zz_cr(m+38) zz_cr(m+48) zz_cr(m+51) zz_cr(m+57) zz_cr(m+60) zz_cr(m+62)
            zz_cr(m+36) zz_cr(m+37) zz_cr(m+49) zz_cr(m+50) zz_cr(m+58) zz_cr(m+59) zz_cr(m+63) zz_cr(m+64)];
        
       

        m=m+64;
    end
end                     

[x_max y_max]=size(quantised_y);
rgb_matrix=zeros(x_max,y_max,3);
for i=1:x_max/8
    for j=1:y_max/8
        x_cord=(i-1)*8+1;
        y_cord=(j-1)*8+1;
        i_quantised_y=quantised_y(x_cord:x_cord+7,y_cord:y_cord+7).*lumi_quant;
        i_quantised_cb=quantised_cb(x_cord:x_cord+7,y_cord:y_cord+7).*chromi_quant;
        i_quantised_cr=quantised_cr(x_cord:x_cord+7,y_cord:y_cord+7).*chromi_quant;

        
        if (use_matlab_dct==0) || (use_rtl_compressed_data==1)
            % taking idct and level shifting
            unit_matrix_y=128+idct2(i_quantised_y);
            unit_matrix_y(unit_matrix_y>255)=255;
            unit_matrix_y(unit_matrix_y<0)=0;
            unit_matrix_y=unit_matrix_y';

            unit_matrix_cb=128+idct2(i_quantised_cb);
            unit_matrix_cb(unit_matrix_cb>255)=255;
            unit_matrix_cb(unit_matrix_cb<0)=0;            
            unit_matrix_cb=unit_matrix_cb';

            unit_matrix_cr=128+idct2(i_quantised_cr);
            unit_matrix_cr(unit_matrix_cr>255)=255;
            unit_matrix_cr(unit_matrix_cr<0)=0;
            unit_matrix_cr=unit_matrix_cr';
           
        else
            unit_matrix_y=idct2(i_quantised_y);
            unit_matrix_cb=idct2(i_quantised_cb);
            unit_matrix_cr=idct2(i_quantised_cr);
            unit_matrix_y=unit_matrix_y';
            unit_matrix_cb=unit_matrix_cb';
            unit_matrix_cr=unit_matrix_cr';
            
        end
            
        
        [x y] = size(unit_matrix_y); % this is always expected to be x=8, y=8
        unit_matrix=zeros(x,y,3);
        unit_matrix(:,:,1)=unit_matrix_y;
        unit_matrix(:,:,2)=unit_matrix_cb;
        unit_matrix(:,:,3)=unit_matrix_cr;
        if (use_rtl_compressed_data==0)
            rgb_matrix(x_cord:x_cord+7,y_cord:y_cord+7,:)=(ycbcr2rgb(unit_matrix./256));
        else
           rgb_matrix(x_cord:x_cord+7,y_cord:y_cord+7,:)=((ycbcr2rgb_custom(unit_matrix))./256);
        end
    end
end

orig_rgb_matrix=tiff_img;
fig1=figure();image(orig_rgb_matrix);title('original');
print(fig1,'original','-dtiff');
fig2=figure();image(rgb_matrix);title('reconstructed');
print(fig2,'reconstructed','-dtiff');
ssim_value=ssim(rgb_matrix,orig_rgb_matrix)
psnr_value=psnr(rgb_matrix,orig_rgb_matrix)

orig_file=dir('./orig_image.mat');
if (use_rtl_compressed_data==0)
    compressed_file=dir('./compressed.mat');
else
    compressed_file=dir('./compressed_rtl.mat');
end
    
compression_ratio=orig_file.bytes/compressed_file.bytes
quality_factor=QF

use_matlab_dct=use_matlab_dct
use_rtl_compressed_data=use_rtl_compressed_data
save('decompressed_parameters.mat','ssim_value','psnr_value','compression_ratio','QF','use_matlab_dct');

