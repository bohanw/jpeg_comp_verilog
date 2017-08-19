function matrix_out = ycbcr2rgb_custom(matrix_in)

% matrix_in is 8*8*3 input that is 8*8 block with 3 channels y ,cb, cr
% matrix_out is 8*8*3 output that is 8*8 block with 3 channels r, g, b

matrix_out=zeros(8,8,3);

matr=[1 0 1.4
    1 -0.343 -0.711
    1 1.765 0];

for i=1:8
    for j=1:8
        ycbcr=matrix_in(i,j,:); % extracting 1 pixel
        rgb=(matr*[ycbcr(1)
            ycbcr(2)-128
            ycbcr(3)-128]); % getting rgb for 1 pixel
        matrix_out(i,j,:)=rgb;
    end
end


end

