

clear all;
close all;
%ssim_value_array=zeros(8,13);
%psnr_value_array=zeros(8,13);
%compression_ratio_array=zeros(8,13);
%savefile= 'total_loop_results.mat';
%save(savefile,'ssim_value_array','psnr_value_array','compression_ratio_array');
            load tmp_store.mat;
            load total_loop_results.mat;


for i=8:9
    if i==7  
        for j=7:i+4
            stage1_apprx=i;
            stage2_apprx=j;
            savefile= 'apprx_control.mat';
            save(savefile,'stage1_apprx','stage2_apprx');
            savefile='tmp_store.mat';
            save(savefile,'i','j');
            total_chain;
            load tmp_store.mat;
            load total_loop_results.mat;
            ssim_value_array(i,j)=ssim_value;
            psnr_value_array(i,j)=psnr_value;
            compression_ratio_array(i,j)=compression_ratio;
            savefile= 'total_loop_results.mat';
            save(savefile,'ssim_value_array','psnr_value_array','compression_ratio_array');
            if (psnr_value<25)
                break;
            end
        end
    else
        for j=i-1:i+4
            stage1_apprx=i;
            stage2_apprx=j;
            savefile= 'apprx_control.mat';
            save(savefile,'stage1_apprx','stage2_apprx');
            savefile='tmp_store.mat';
            save(savefile,'i','j');
            total_chain;
            load tmp_store.mat;
            load total_loop_results.mat;
            ssim_value_array(i,j)=ssim_value;
            psnr_value_array(i,j)=psnr_value;
            compression_ratio_array(i,j)=compression_ratio;
            savefile= 'total_loop_results.mat';
            save(savefile,'ssim_value_array','psnr_value_array','compression_ratio_array');
             if (psnr_value<25)
                break;
             end                       
        end    
    end
end

        

