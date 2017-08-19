clear;
%% 1D DCT cosine coefficients
 constt=ones(1,8);
 constt(1)=1/sqrt(2);
 arr=ones(8,8);
 for i=1:8
for x=1:8
arr(i,x)=(cos((2*(x-1)+1)*(i-1)*pi/16)*constt(i)/sqrt(4));
end
 end
arr*2^7

