function [s] = rca_dummy(a,b,var,var1)
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
            [c(i),s(i)]=fa_dummy(a(i),b(i),0,var1);
        else
            [c(i),s(i)]=fa_dummy(a(i),b(i),0,'i1');
        end
    else
        if var>0        
            [c(i),s(i)]=fa_dummy(a(i),b(i),c(i-1),var1);
        else
            [c(i),s(i)]=fa_dummy(a(i),b(i),c(i-1),'i1');
        end
    end
    var=var-1;
end
end


