%% ========================== CUT MENU ====================================

% Import Parameters:
function VPR = MAIN(VPR)

%[file directory] = uigetfile('.inc', 'Select The INCLUDE files', 'MultiSelect', 'on');

n_param = size(VPR,2);


% Auto add '.inc' in read file:
for i = 1: size(VPR,2); VPR{1,i} = [VPR{1,i} '.inc']; end

for i = 1:n_param
    file = VPR{1,i};
    VPR{2,i} = INC2CELL (file);
end


% Transform the parameters 'Cell' to 'Mat':
for i = 1:n_param
    ARRAY = createarray(VPR{2,i});
    VPR{2,i} = ARRAY;
end


sz_grid = input('Enter CURRENT grid size [X, Y, Z]: ');
x = sz_grid(1);
y = sz_grid(2);
z = sz_grid(3);


new_grid = input('Enter the dimension of the NEW grid [X, Y, Z]: ');
xf = new_grid(1);
yf = new_grid(2);
zff = new_grid(3);

zf = [];

if sz_grid(3) == new_grid(3)
   zf(1) = 1;
   zf(2) = new_grid(3);
else
    zf = input('Enter the range of layers in "z" that you want to cut [TOP, BASE]: ');
end

corner = input('Enter the CORNER you want to cut [X, Y]: ');


% Cut each parameters vector:
for i = 1:n_param
    txt = VPR{1,i};
    find = strfind(txt,'grid');
    if find > 0
        Dvd_grid = blockreader (VPR{2,i},x,y,z);
        for j = 1: size(Dvd_grid,2)
            Grid_cut = Cut_grid(Dvd_grid{j},x,y,xf,yf,zf,corner);
            Dvd_grid{j} = Grid_cut;
        end
        grid_array = Agrup_grid(Dvd_grid, xf, yf, zff);
        VPR{2,i} = grid_array;
    else
        Grid_cut = Cut_grid(VPR{2,i},x,y,xf,yf,zf,corner);
        VPR{2,i} = Grid_cut;
    end
end

%VPR = INFO(VPR)

clearvars x xf y yf z prompt n_param i Grid_cut find file cellparam ...
    ARRAY Dvd_grid grid_array txt;






    