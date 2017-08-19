function y = dc_code(x)

y=0;
for i=10:-1:0
    if abs(x)>=(2^i)
        y=i+1;
        break;
    end
end             
end
