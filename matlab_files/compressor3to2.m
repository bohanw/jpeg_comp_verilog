function [cout,s] = compressor3to2(a,b,c,var)
len=length(a);
%var = no of approx bits
for i = 1:len
    if var>0
        [cout(i),s(i)]=fa(a(i),b(i),c(i),'a');
    else
        [cout(i),s(i)]=fa(a(i),b(i),c(i),'i');
    end
    var=var-1;        
end

end



