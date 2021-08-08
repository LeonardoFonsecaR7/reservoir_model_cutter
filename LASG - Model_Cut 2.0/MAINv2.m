%% ========================== CUT MENU ====================================

% Import Parameters:
function [inc] = MAINv2()

% Pre-set Grid Configurations:
% CURRENT grid size:            % NEW grid size:
gsize = [46, 69, 30];           newgsize = [21, 21, 30];

% Initial Corners to cut [X, Y]:    % Top and Base Z layers:
coord = [17, 33, 1];                % zcoord = [1, 30];

[file, directory] = uigetfile('.inc', 'Select The INCLUDE files', 'MultiSelect', 'on');

% Condition if select just one file
if class(file) == 'char'
    f{1,1} = file; file = f;
end

for i = 1 : size(file,2)
    inc = importINC ([directory file{1,i}]);
    
    if prod(gsize) ~= size(inc,2) && prod(gsize)*24 ~= size(inc,2)
        disp ('Mismatch dimentions of input grid size');
        break
    end
    
    % Cut Matrizes
    if  size(inc,2) == prod(gsize)*24
        Dvd_grid = blockreader (inc,gsize(1),gsize(2),gsize(3));
        for j = 1: size(Dvd_grid,2)
            Grid_cut = Cut_gridv2(Dvd_grid{j},gsize,newgsize,coord);
            Dvd_grid{j} = Grid_cut;
        end
        grid_array = Agrup_grid(Dvd_grid, newgsize(1), newgsize(2), newgsize(3));
        inc = grid_array; 
        name = strrep(file{1,i}, '.inc', '');
        save([name 'cut' num2str(newgsize(1)) '.inc'], 'inc','-ascii');
    else
        Grid_cut = Cut_gridv2(inc,gsize,newgsize,coord);
        inc = Grid_cut;
        name = strrep(file{1,i}, '.inc', '');
        save([name 'cut' num2str(newgsize(1)) '.inc'], 'inc','-ascii');
    end 
end
fclose all;
end
