function [s] = rca_sub(a,b,var)
% function is a-b
a=[a a(end)]; %sign extend
b=[b b(end)];
len=length(a);
if length(a)~=length(b)
    error rca_input_length_mismatch;
end
b=1-b; %inverting
%var = no of approx bits
for i = 1:len
    if i==1
        if var>0
            [c(i),s(i)]=fa(a(i),b(i),1,'a'); %note that cin is 1
        else
            [c(i),s(i)]=fa(a(i),b(i),1,'i'); %note that cin is 1
        end
    else
        if var>0        
            [c(i),s(i)]=fa(a(i),b(i),c(i-1),'a');
        else
            [c(i),s(i)]=fa(a(i),b(i),c(i-1),'i');
        end
    end
    var=var-1;
end
end


