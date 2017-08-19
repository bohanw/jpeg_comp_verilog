function [fileid]= print2file( matrix, filepath )
%print binary number to file
%   Detailed explanation goes here

fileid = fopen(filepath,'w');

[row,col,width] = size(matrix);

for i = 1:row
    for j = 1:col
        for k = width :-1: 1
            fprintf(fileid,'%d',matrix(i,j,k)); 
        end
        fprintf(fileid, '\t');
    end
    fprintf(fileid, '\n');
end
    


end

