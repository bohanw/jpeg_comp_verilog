clear all;
tiff_img_full=(im2double(imread('../../images/tomato.jpg')));
[x y z]=size(tiff_img_full);
x_max=(floor(x/8)*8);
y_max=(floor(y/8)*8);
%x_max=(32/8)*8;
%y_max=(32/8)*8;
tiff_img_int=tiff_img_full(1:x_max,1:y_max,:);
%tiff_img=round(((tiff_img_int.*256)-128),0);
%tiff_img(tiff_img>127)=127;
tiff_img=round(((tiff_img_int.*256)),0);
tiff_img(tiff_img>255)=255; % RGB input to test-bench is 0 to 255 unsigned number only

fid_r=fopen('red_pixel.txt','w');
fid_g=fopen('green_pixel.txt','w');
fid_b=fopen('blue_pixel.txt','w');


for i=1:x_max/8
    for j=1:y_max/8
        block=tiff_img((i-1)*8+1:8*i,(j-1)*8+1:8*j,:);
        for l=1:8
                fprintf(fid_r,'%d\n',block(:,l,1));
                fprintf(fid_g,'%d\n',block(:,l,2));
                fprintf(fid_b,'%d\n',block(:,l,3));
        end
    end
end


fclose(fid_r);
fclose(fid_g);
fclose(fid_b);




