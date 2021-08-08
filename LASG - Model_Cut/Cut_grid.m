%% ================ CREATE LAYERS FOR CUT MODEL ===========================

function Grid_cut = Cut_grid(PARAM,x,y,xf,yf,zf,corner)

% Grid Dimensions
% ---> Real Model:
% x; y; z; 

aa = x*y;

% ---> After Cut:
%xf; yf; zf;

% ---> Corner Point of New SubModel:
%corner = [X,Y];

% ---> Prealocate SubModel:
grid_cut = cell(1,30);

cut_xA = corner(1) - 1;
cut_xD = xf + 1;
cut_yA = corner(2) - 1;
cut_yD = yf + 1;

layer_all = reshape(PARAM, aa, []);
layer_all = layer_all';

for i = zf(1):zf(2)
    layer = layer_all(i,:);
    layer = reshape(layer, x,[]);
    layer = layer';
    
    % ----------------------- Cut Y before --------------------------------
    layer(1:cut_yA,:) = [];
    % ----------------------- Cut Y after ---------------------------------
    layer(cut_yD:end,:) = [];
    % ----------------------- Cut X before --------------------------------
    layer(:,1:cut_xA) = [];
    % ----------------------- Cut X after ---------------------------------
    layer(:,cut_xD:end) = [];
    
    layer = reshape(layer',1,[]);
    grid_cut{i} = layer;
end


Grid_cut = cell2mat(grid_cut);

clearvars aa cut_xA cut_xD cut_yA cut_yD x y z xf yf zf grid_cut i layer...
    layer_all;
