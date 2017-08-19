function out=mul(a,n,var)
switch n
    case 64
        out=[0 0 0 0 0 0 a];
    case 60
        tmp1=[0 0 0 0 0 0 a];
        tmp2=[0 0 a];
        tmp4=[tmp2 tmp2(end)*ones(1,4)]; %sign extend
        [out]=rca_sub(tmp1,tmp4,var); %tmp1-tmp4
    case 56
        tmp1=[0 0 0 0 0 0 a];
        tmp2=[0 0 0 a];
        tmp4=[tmp2 tmp2(end)*ones(1,3)]; %sign extend
        [out]=rca_sub(tmp1,tmp4,var); %tmp1-tmp4
    case 45
        tmp1=[a a(end)*ones(1,5)];
        tmp2=[0 0 a a(end)*ones(1,3)];
        tmp3=[0 0 0 a a(end)*ones(1,2)];
        tmp4=[0 0 0 0 0 a];
        out=csa_4input(tmp1,tmp2,tmp3,tmp4,var);           
    case 36
        tmp1=[0 0 a a(end)*ones(1,3)]; %left shift and sign extend
        tmp2=[0 0 0 0 0 a];
        [out]=rca(tmp1,tmp2,var);
    case 24
        tmp1=[0 0 0 a a(end)*ones(1,1)]; %left shift and sign extend
        tmp2=[0 0 0 0 a];
        [out]=rca(tmp1,tmp2,var);
    case 12
        tmp1=[0 0 a a(end)*ones(1,1)]; %left shift and sign extend
        tmp2=[0 0 0 a];
        [out]=rca(tmp1,tmp2,var);
    otherwise
        disp('error in mul');
end
max_length=min(length(out),length(a)+6);
out=out(1:max_length); % max allowed growth is 6 bits only, so if there are extra bits they are only sign extension

end

        
        
       
        
        
        
        
