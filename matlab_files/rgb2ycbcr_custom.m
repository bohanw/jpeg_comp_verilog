function matrix_out = rgb2ycbcr_custom(matrix_in)

%input has to be 8*8 block with each block having r,g,b components
% input is 0 to 255 
% output is -128 to 127

matrix_out=zeros(8,8,3);
matr=[0.299 0.587 0.114
    -0.168736 -0.331264 0.5
    0.5 -0.418688 -0.081312];

matra=matr.*(2^14);
matra1=round(matra)./(2^14); 

matr1=[0
    128
    128];

for i=1:8
    for j=1:8
        rgb=[matrix_in(i,j,1)
            matrix_in(i,j,2)
            matrix_in(i,j,3)];
        ycbcr=(matr1+matr*(rgb))-128;
        matrix_out(i,j,:)=ycbcr;
    end
end
end
