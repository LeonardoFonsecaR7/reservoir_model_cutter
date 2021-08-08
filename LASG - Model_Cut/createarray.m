%% ===================== Create Parameter Array ===========================


function ARRAY = createarray(input)


% Example:
%  M = createarray(POR);
 
MATRIX=cell(size(input));
for LIN=1:size(input,1)
    for COL=1:size(input,2)
    z=0;
    for i=1:size(input{LIN,COL},2)        
       if input{LIN,COL}(i) == '*'
           
                if i == 2
                    z=input{LIN,COL}(1);
                elseif i == 3
                    z=strcat(input{LIN,COL}(1),input{LIN,COL}(2));
                elseif i == 4
                    z=strcat(input{LIN,COL}(1),input{LIN,COL}(2),input{LIN,COL}(3));
                elseif i == 5
                    z=strcat(input{LIN,COL}(1),input{LIN,COL}(2),input{LIN,COL}(3),input{LIN,COL}(4));  
                end
               y=strcat(input{LIN,COL}((i+1):size(input{LIN,COL},2)));
               z=strcat(input{LIN,COL}(1:(i-1)));
               MATRIX{LIN,COL}=ones(1,str2num(z))*str2num(y);
       end
               
    end
    if z==0
               MATRIX{LIN,COL}=str2num(input{LIN,COL});
    end
    end
end

ARRAY=[];
for LIN=1:size(MATRIX,1)
    
    ARRAY=[ARRAY cell2mat(MATRIX(LIN,:))];
end

