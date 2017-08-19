function final_array = huffman_decode(input)
% NOTE : input has to be column binary stream and not a row binary stream
eob_check=[1 0 1 0]; %full code 0x28000000;

input=flip(input);
for i=1:length(input)
    if (isequal(input(i:i+3),fliplr(eob_check)'))
        break;
    end
    i=i+1;
end
input=flip(input);
input=input(1:end+1-i); % this above loop and code is to remove the extraneous bits after final EOB in the image
    


input=input';
final_array=[];
array=[];
eob_not_checked=1;
zero_run_not_checked=1;
zero_run_check=[1 1 1 1 1 1 1 1 0 0 1]; %full code 0x3fc8000
prev_state='EOB';
i=1;
while (i<=length(input))
    if (strcmp(prev_state,'EOB'))
        % DC VLC coding for size
        array=[array input(i)];
        [valid_code,dc_size]=dc_vlc_decode(array);
        if (valid_code==1)
            final_array=[final_array dc_size];
            array=[];
            prev_state='DC_VLC';
        end
        i=i+1;
        
    elseif (strcmp(prev_state,'DC_VLC'))
        % DC VLI coding for amplitude
        if (dc_size~=0)
            array=input(i:i+dc_size-1);
            dc_amp=vli_decode(array);%vli decode is same for dc and ac
        else
            dc_amp=0;
        end
        final_array=[final_array dc_amp];
        array=[];
        prev_state='DC_VLI';
        i=i+dc_size;
    elseif ((strcmp(prev_state,'DC_VLI')) || (strcmp(prev_state,'AC_VLI')))
        % AC coding => first find if its normal or EOB or 16 zeros
        
        %check for EOB
        if (isequal(input(i:i+3),eob_check) && (eob_not_checked==1))
            eob_not_checked=1; 
            zero_run_not_checked=1;
            
            final_array=[final_array 0 0]; %% 0 0 will be decoded as EOB
            array=[];
            prev_state='EOB';
            if (mod(i+3,32)==0)
                i=i+4; %4 is eob total code size
            else
                i=((floor((i+3)/32)+1)*32)+1; %this is to make sure we bypass the bits following the eob in 32 bit stream since it is dummy
            end
        else
            eob_not_checked=0;
            %check for 16 continuous zeros
            if ((i+10)<=length(input))
                if (isequal(input(i:i+10),zero_run_check) && (zero_run_not_checked==1))
                    zero_run_not_checked=1;
                    eob_not_checked=1;

                    final_array=[final_array 15 0];%% 15 0 will be decoded as 16 continuous zeros
                    array=[];
                    %no change in prev_state
                    i=i+11; %11 is 16 zeros total code size
                    continue;
                end
            end
            
                % normal AC VLC coding for zrl,ac_size
                zero_run_not_checked=0;
                array=[array input(i)];
                [valid_code,zrl,ac_size]=ac_vlc_decode(array);
                if (valid_code==1)
                    zero_run_not_checked=1;
                    eob_not_checked=1;
                    
                    final_array=[final_array zrl ac_size];
                    array=[];
                    prev_state='AC_VLC';
                end
                i=i+1;
            end
    elseif (strcmp(prev_state,'AC_VLC'))
        % AC VLI coding for amplitude
        array=input(i:i+ac_size-1);
        ac_amp=vli_decode(array); %vli decode is same for dc and ac
        final_array=[final_array ac_amp];
        array=[];
        prev_state='AC_VLI';
        i=i+ac_size;
    end
end
end

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                    
                
                
                
            
        
        
        
        
        
            
        
