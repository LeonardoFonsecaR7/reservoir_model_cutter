% ===============================================================
%
%       Transform a matriz as required for CMG-Simulator
%
% ===============================================================


function [c] = inc2cmg(file)

j = 1;
k = 1;
for i = 1:size(file,2)
    
        if  i == size(file,2) && file(i) == file(i-1)
            k = k + 1;
            c{1,j} = [num2str(k) '*' num2str(file(i))];
            
        elseif i == size(file,2) && file(i) ~= file(i-1)
            c{1,j} = num2str(file(i));
            
        elseif file(i) == file(i+1)
            k = k + 1;
            
        elseif file(i) == file(i-1) &&  file(i) ~= file(i+1)
            c{1,j} = [num2str(k) '*' num2str(file(i))];
            j = j + 1;
            k = 1;
            
        elseif file(i) ~= file(i-1) &&  file(i) ~= file(i+1)
            c{1,j} = num2str(file(i));
            j = j + 1;
        end
end
    
% for i = 1:size(c,2)
%     c{1,i} = [c{1,i} ' '];
% end
% 
% c = [c{1,:}];


end





