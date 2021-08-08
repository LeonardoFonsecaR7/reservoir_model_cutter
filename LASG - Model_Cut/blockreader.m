%% ========================= Reader Vertex ================================

function Dvd_grid = blockreader (c, DI,DJ,DK);
%DI=46;
%DJ=69;
%DK=30;

% t=size(c,1);
% Mx=c(t/3*0+1:t/3*1);
% My=c(t/3*1+1:t/3*2);
% Mz=c(t/3*2+1:t/3*3);


cger=1;
cNWT=1;cNET=1;cSET=1;cSWT=1;
cNWB=1;cNEB=1;cSEB=1;cSWB=1;
for k=1:DK
    for j=1:DJ
        for i=1:DI
            NW_T_x(cNWT)=c(cger);
            cger=cger+1;
            NE_T_x(cNWT)=c(cger);
            cger=cger+1;
            cNWT=cNWT+1;
        end
        for i=1:DI
            SW_T_x(cNET)=c(cger);
            cger=cger+1;
            SE_T_x(cNET)=c(cger);
            cger=cger+1;
            cNET=cNET+1;
        end
    end
    for j=1:DJ
        for i=1:DI
            NW_B_x(cNWB)=c(cger);
            cger=cger+1;
            NE_B_x(cNWB)=c(cger);
            cger=cger+1;
            cNWB=cNWB+1;
        end
        for i=1:DI
            SW_B_x(cNEB)=c(cger);
            cger=cger+1;
            SE_B_x(cNEB)=c(cger);
            cger=cger+1;
            cNEB=cNEB+1;
        end
    end
end

cNWT=1;cNET=1;cSET=1;cSWT=1;
cNWB=1;cNEB=1;cSEB=1;cSWB=1;
    for k=1:DK
        for j=1:DJ
            for i=1:DI
                NW_T_y(cNWT)=c(cger);
                cger=cger+1;
                NE_T_y(cNWT)=c(cger);
                cger=cger+1;
                cNWT=cNWT+1;
            end
            for i=1:DI
                SW_T_y(cNET)=c(cger);
                cger=cger+1;
                SE_T_y(cNET)=c(cger);
                cger=cger+1;
                cNET=cNET+1;
            end
        end
        for j=1:DJ
            for i=1:DI
                NW_B_y(cNWB)=c(cger);
                cger=cger+1;
                NE_B_y(cNWB)=c(cger);
                cger=cger+1;
                cNWB=cNWB+1;
            end
            for i=1:DI
                SW_B_y(cNEB)=c(cger);
                cger=cger+1;
                SE_B_y(cNEB)=c(cger);
                cger=cger+1;
                cNEB=cNEB+1;
            end
        end
    end

cNWT=1;cNET=1;cSET=1;cSWT=1;
cNWB=1;cNEB=1;cSEB=1;cSWB=1;
    for k=1:DK
        for j=1:DJ
            for i=1:DI
                NW_T_z(cNWT)=c(cger);
                cger=cger+1;
                NE_T_z(cNWT)=c(cger);
                cger=cger+1;
                cNWT=cNWT+1;
            end
            for i=1:DI
                SW_T_z(cNET)=c(cger);
                cger=cger+1;
                SE_T_z(cNET)=c(cger);
                cger=cger+1;
                cNET=cNET+1;
            end
        end
        for j=1:DJ
            for i=1:DI
                NW_B_z(cNWB)=c(cger);
                cger=cger+1;
                NE_B_z(cNWB)=c(cger);
                cger=cger+1;
                cNWB=cNWB+1;
            end
            for i=1:DI
                SW_B_z(cNEB)=c(cger);
                cger=cger+1;
                SE_B_z(cNEB)=c(cger);
                cger=cger+1;
                cNEB=cNEB+1;
            end
        end
    end

% ---> Atrelando os vetores do vertice a CellArray final
Dvd_grid = cell(1,24);
Dvd_grid{1}= NW_T_x;
Dvd_grid{2}= NE_T_x;
Dvd_grid{3}= SW_T_x;
Dvd_grid{4}= SE_T_x;
Dvd_grid{5}= NW_B_x;
Dvd_grid{6}= NE_B_x;
Dvd_grid{7}= SW_B_x;
Dvd_grid{8}= SE_B_x;
Dvd_grid{9}= NW_T_y;
Dvd_grid{10}= NE_T_y;
Dvd_grid{11}= SW_T_y;
Dvd_grid{12}= SE_T_y;
Dvd_grid{13}= NW_B_y;
Dvd_grid{14}= NE_B_y;
Dvd_grid{15}= SW_B_y;
Dvd_grid{16}= SE_B_y;
Dvd_grid{17}= NW_T_z;
Dvd_grid{18}= NE_T_z;
Dvd_grid{19}= SW_T_z;
Dvd_grid{20}= SE_T_z;
Dvd_grid{21}= NW_B_z;
Dvd_grid{22}= NE_B_z;
Dvd_grid{23}= SW_B_z;
Dvd_grid{24}= SE_B_z;
    
    
    
    
   

    
    
    
    
    
    
    
    
    