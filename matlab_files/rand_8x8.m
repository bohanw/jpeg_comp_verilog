function [ img_block,img_block_ref,fileid ] = rand_8x8(filepath)
%Generate two's complement matrix pixel 

img_block = zeros(8,8);
fileid = fopen(filepath,'w');
img_block_ref = zeros(8,8);
for i =1:8
    for j=1:8
        r = randi(256) - 1;
        img_block_ref(i,j) = r;
        if r > 127 
            img_block(i,j) = r - 256;
        else img_block(i,j) = r;
        end
        s = dec2bin2(img_block(i,j));
        fprintf(fileid, '%s\t',s);
    end
    fprintf(fileid,'\n');
    
end

fclose(fileid);
end

