function [valid_code,dc_size] = dc_vlc_decode(array)

array_len=length(array);
valid_code=0;
dc_size=0;

code_lut=[
    0 0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0 0
    1 0 1 0 0 0 0 0 0
    1 1 0 0 0 0 0 0 0
    1 1 1 0 0 0 0 0 0 
    1 1 1 1 0 0 0 0 0
    1 1 1 1 1 0 0 0 0
    1 1 1 1 1 1 0 0 0
    1 1 1 1 1 1 1 0 0
    1 1 1 1 1 1 1 1 0];

code_lim=[
    2
    3
    3
    3
    3
    3
    4
    5
    6
    7
    8
    9];


size_code=size(code_lut);
total_codes=size_code(1);

for i=1:total_codes
    if (isequal(array,code_lut(i,1:code_lim(i))))
       valid_code=1;
       dc_size=i-1;
       break;
    end
end
    
    
end