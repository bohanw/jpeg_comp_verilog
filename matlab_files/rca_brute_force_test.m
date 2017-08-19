close all;
clear all;
error_var=zeros(6,5);
error_mean=zeros(6,5);
var1={'a1' 'a2' 'a3' 'a4' 'a5' 'a6'};
save('save_rca.mat','error_var','error_mean','var1');
for apprxn=1:6
for ii=1:5
input_decimal=0:2^(2+2*ii)-1;
bin_str=dec2bin(input_decimal);
[rows,clms]=size(bin_str);
out_bin=zeros(rows,clms);
for i=1:rows
    for j=1:clms
        out_bin(i,j)=str2num(bin_str(i,j));
    end
end
width=clms/2;
for i=1:rows
    out_ideal(i)=weighted_sum(rca_dummy(out_bin(i,1:width),out_bin(i,(width)+1:end),0,var1(apprxn)));
    out_apprx(i)=weighted_sum(rca_dummy(out_bin(i,1:width),out_bin(i,(width)+1:end),width-1,var1(apprxn)));
end

mean_error=(sum(out_apprx-out_ideal))/rows;
var_error=(sum((out_apprx-out_ideal).^2))/rows - (mean_error^2);
load save_rca.mat;
error_mean(apprxn,ii)=mean_error;
error_var(apprxn,ii)=var_error;
save('save_rca.mat','error_var','error_mean');
save temp.mat apprxn ii var1;
clear all;
load temp.mat;
end
end

load save_rca.mat
error_mean
error_var

[qwe,x_max]=size(error_mean);
x=1:x_max;
plot(x,error_mean(1,:),'r*-',x,error_mean(2,:),'bo-',x,error_mean(3,:),'gs-',x,error_mean(4,:),'kd-',x,error_mean(5,:),'cv-',x,error_mean(6,:),'mh-');
title('ERROR MEAN RCA');
legend('Approximation1','Approximation2','Approximation3','Approximation4','Approximation5','Truncation');
xlabel('Number of LSB bits approximated');
ylabel('Mean Error');
grid on;
figure();
plot(x,error_var(1,:),'r*-',x,error_var(2,:),'bo-',x,error_var(3,:),'gs-',x,error_var(4,:),'kd-',x,error_var(5,:),'cv-',x,error_var(6,:),'mh-');
title('ERROR VARIANCE RCA');
legend('Approximation1','Approximation2','Approximation3','Approximation4','Approximation5','Truncation');
xlabel('Number of LSB bits approximated');
ylabel('Error Variance');
grid on;

