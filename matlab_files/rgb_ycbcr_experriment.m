clear all;
close all;
matr=[0.299 0.587 0.114
    -0.168736 -0.331264 0.5
    0.5 -0.418688 -0.081312];

matra=matr.*(2^14);
matra1=round(matra); % this is the one we should implement in hardware
matr1=[0
    128
    128];

rgb_t=[101.3961 0 0]; % enter rgb value in 0 to 255 range
rgb=rgb_t';
ycbcr=matr1+matr*(rgb-128);
ycbcr2=(matr1+matr*(rgb))-128;
round(ycbcr2)

%ycbcr=matr1+matr*(rgb)

matr=[1 0 1.4
    1 -0.343 -0.711
    1 1.765 0];
rgb_inv=(matr*[ycbcr(1)
    ycbcr(2)-128
    ycbcr(3)-128])+128

temp=ycbcr2+128;
rgb_inv2=(matr*[temp(1)
    temp(2)-128
    temp(3)-128])

