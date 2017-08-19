function [s] = rca(a,b,var)
a=[a a(end)]; %sign extend
b=[b b(end)];
len=length(a);
if length(a)~=length(b)
    error rca_input_length_mismatch;
end
%var = no of approx bits
for i = 1:len
    if i==1
        if var>0
            [c(i),s(i)]=fa(a(i),b(i),0,'a');
        else
            [c(i),s(i)]=fa(a(i),b(i),0,'i');
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


