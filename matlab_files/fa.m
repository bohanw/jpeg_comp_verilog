function [cout,s] = fa(a,b,cin,var)
if (strcmp(var,'i'))
    cout=a*b+b*cin+a*cin-2*a*b*cin;
    s=a*b*cin+(1-a)*(1-b)*cin+(1-a)*(1-cin)*b+(1-cin)*(1-b)*a;
else
    %if strcmp(var,'a1')
    %% apprx 1
    %cout=a*b*cin+a*b*(1-cin)+a*(1-b)*cin+b*(1-a)*cin+b*(1-a)*(1-cin);
    %s=(1-a)*(1-b)*cin+a*b*cin;
    %elseif strcmp(var,'a2')
    %% apprx 2
%     cout=a*b+(1-a)*b*cin+(1-b)*a*cin;
%     s=1-cout;
%     elseif strcmp(var,'a3')
%     %% apprx 3
%     cout=a*b*cin+a*b*(1-cin)+a*cin*(1-b)+b*cin*(1-a)+b*(1-a)*(1-cin);
%     s=1-cout;
%     elseif strcmp(var,'a4')
%     %% apprx 4
%     cout = a;
%     s=cin*(1-a)*(1-b)+b*(1-a)*cin+a*b*cin;
%     elseif strcmp(var,'a5')
    %% apprx 5
    cout=a;
    s=b;
%     else strcmp(var,'tr')
%     %% truncate
%     cout=0;
%     s=0;
%     end
end
end
