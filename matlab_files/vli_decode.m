function [amp] = vli_decode(array)
%NOTE : vli decode function can be used for both AC, DC
%NOTE : array(1) is MSB , array(end) is LSB
if (array(1)==1) % positive number
    tmp=ones(1,length(array));
    i=0:length(tmp)-1;
    i_flip=fliplr(i);
    bin_array=tmp.*(2.^i_flip);
    amp=sum(bin_array.*array);
else %negative number
    flip_array=fliplr([1 array]);
    amp=weighted_sum(flip_array)+1; %NOTE : weighted_sum is input(1) is LSB and input(end) is MSB , and it is signed binary
end

end
