%% ======================= Agrup Grid =====================================


% Model Dimensions 

function grid_array = Agrup_grid(Dvd_grid, DI, DJ, DK)

grd_size = DI*DJ*DK*3*8*3;

% Conditionals 
grid_cut = cell(1,grd_size);
cont = 1;

NWTX=0;NETX=0;NWBX=0;NEBX=0;
SWTX=0;SETX=0;SWBX=0;SEBX=0;

NWTY=0;NETY=0;NWBY=0;NEBY=0;
SWTY=0;SETY=0;SWBY=0;SEBY=0;

NWTZ=0;NETZ=0;NWBZ=0;NEBZ=0;
SWTZ=0;SETZ=0;SWBZ=0;SEBZ=0;

for z = 1:DK
    for y = 1:DJ
        for x = 1:DI
            NWTX = NWTX + 1;
            NETX = NETX + 1;
            grid_cut{1,cont} = Dvd_grid{1}(NWTX);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{2}(NETX);
            cont = cont + 1;
        end
        for x = 1:DI
            SWTX = SWTX + 1;
            SETX = SETX + 1;
            grid_cut{1,cont} = Dvd_grid{3}(SWTX);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{4}(SETX);
            cont = cont + 1;
        end
    end
    for y = 1:DJ
        for x = 1:DI
            NWBX = NWBX + 1;
            NEBX = NEBX + 1;
            grid_cut{1,cont} = Dvd_grid{5}(NWBX);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{6}(NEBX);
            cont = cont + 1;
        end
        for x = 1:DI
            SWBX = SWBX + 1;
            SEBX = SEBX + 1;
            grid_cut{1,cont} = Dvd_grid{7}(SWBX);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{8}(SEBX);
            cont = cont + 1;
        end
    end
end

for z = 1:DK
    for y = 1:DJ
        for x = 1:DI
            NWTY = NWTY + 1;
            NETY = NETY + 1;            
            grid_cut{1,cont} = Dvd_grid{9}(NWTY);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{10}(NETY);
            cont = cont + 1;
        end
        for x = 1:DI
            SWTY = SWTY + 1;
            SETY = SETY + 1;            
            grid_cut{1,cont} = Dvd_grid{11}(SWTY);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{12}(SETY);
            cont = cont + 1;
        end
    end
    for y = 1:DJ
        for x = 1:DI
            NWBY = NWBY + 1;
            NEBY = NEBY + 1;            
            grid_cut{1,cont} = Dvd_grid{13}(NWBY);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{14}(NEBY);
            cont = cont + 1;
        end
        for x = 1:DI
            SWBY = SWBY + 1;
            SEBY = SEBY + 1;            
            grid_cut{1,cont} = Dvd_grid{15}(SWBY);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{16}(SEBY);
            cont = cont + 1;
        end
    end
end

for z = 1:DK
    for y = 1:DJ
        for x = 1:DI
            NWTZ = NWTZ + 1;
            NETZ = NETZ + 1;            
            grid_cut{1,cont} = Dvd_grid{17}(NWTZ);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{18}(NETZ);
            cont = cont + 1;
        end
        for x = 1:DI
            SWTZ = SWTZ + 1;
            SETZ = SETZ + 1;
            grid_cut{1,cont} = Dvd_grid{19}(SWTZ);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{20}(SETZ);
            cont = cont + 1;
        end
    end
    for y = 1:DJ
        for x = 1:DI
            NWBZ = NWBZ + 1;
            NEBZ = NEBZ + 1;            
            grid_cut{1,cont} = Dvd_grid{21}(NWBZ);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{22}(NEBZ);
            cont = cont + 1;
        end
        for x = 1:DI            
            SWBZ = SWBZ + 1;
            SEBZ = SEBZ + 1;
            grid_cut{1,cont} = Dvd_grid{23}(SWBZ);
            cont = cont + 1;
            grid_cut{1,cont} = Dvd_grid{24}(SEBZ);
            cont = cont + 1;
        end
    end
end

grid_array = cell2mat(grid_cut);

