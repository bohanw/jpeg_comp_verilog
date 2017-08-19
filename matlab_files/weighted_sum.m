function out = weighted_sum(a)
% this function considers a to be 2's complement signed binary arry 
if (max(a)>1 ||  min(a)<0)
    error 'error in weighted sum';
end
len=length(a);
out=0;
for i=1:len-1
    out=out+a(i)*(2^(i-1));
end
i=len;
out=out-a(i)*(2^(i-1));
end
