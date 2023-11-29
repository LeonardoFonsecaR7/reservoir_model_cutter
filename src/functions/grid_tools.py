import numpy as np


def reader(c, DI, DJ, DK):
    # Initialize variables
    count = 0

    # Initialize lists to store values for each direction
    NW_T_x, NE_T_x, SW_T_x, SE_T_x = [], [], [], []
    NW_B_x, NE_B_x, SW_B_x, SE_B_x = [], [], [], []
    NW_T_y, NE_T_y, SW_T_y, SE_T_y = [], [], [], []
    NW_B_y, NE_B_y, SW_B_y, SE_B_y = [], [], [], []
    NW_T_z, NE_T_z, SW_T_z, SE_T_z = [], [], [], []
    NW_B_z, NE_B_z, SW_B_z, SE_B_z = [], [], [], []

    # Loop through DK, DJ, DI
    for k in range(DK):
        for j in range(DJ):
            for i in range(DI):
                NW_T_x.append(c[count])
                count += 1
                NE_T_x.append(c[count])
                count += 1

            for i in range(DI):
                SW_T_x.append(c[count])
                count += 1
                SE_T_x.append(c[count])
                count += 1

        for j in range(DJ):
            for i in range(DI):
                NW_B_x.append(c[count])
                count += 1
                NE_B_x.append(c[count])
                count += 1

            for i in range(DI):
                SW_B_x.append(c[count])
                count += 1
                SE_B_x.append(c[count])
                count += 1

    # Repeat the same structure for y and z directions
    for k in range(DK):
        for j in range(DJ):
            for i in range(DI):
                NW_T_y.append(c[count])
                count += 1
                NE_T_y.append(c[count])
                count += 1

            for i in range(DI):
                SW_T_y.append(c[count])
                count += 1
                SE_T_y.append(c[count])
                count += 1

        for j in range(DJ):
            for i in range(DI):
                NW_B_y.append(c[count])
                count += 1
                NE_B_y.append(c[count])
                count += 1

            for i in range(DI):
                SW_B_y.append(c[count])
                count += 1
                SE_B_y.append(c[count])
                count += 1

    for k in range(DK):
        for j in range(DJ):
            for i in range(DI):
                NW_T_z.append(c[count])
                count += 1
                NE_T_z.append(c[count])
                count += 1

            for i in range(DI):
                SW_T_z.append(c[count])
                count += 1
                SE_T_z.append(c[count])
                count += 1

        for j in range(DJ):
            for i in range(DI):
                NW_B_z.append(c[count])
                count += 1
                NE_B_z.append(c[count])
                count += 1

            for i in range(DI):
                SW_B_z.append(c[count])
                count += 1
                SE_B_z.append(c[count])
                count += 1

    # Create the final CellArray
    Dvd_grid = [
        NW_T_x,
        NE_T_x,
        SW_T_x,
        SE_T_x,
        NW_B_x,
        NE_B_x,
        SW_B_x,
        SE_B_x,
        NW_T_y,
        NE_T_y,
        SW_T_y,
        SE_T_y,
        NW_B_y,
        NE_B_y,
        SW_B_y,
        SE_B_y,
        NW_T_z,
        NE_T_z,
        SW_T_z,
        SE_T_z,
        NW_B_z,
        NE_B_z,
        SW_B_z,
        SE_B_z,
    ]

    return Dvd_grid


def group(Dvd_grid, DI, DJ, DK):
    # Initialize conditionals and result list
    grid_cut = []
    cont = 1

    NWTX = NETX = NWBX = NEBX = 0
    SWTX = SETX = SWBX = SEBX = 0

    NWTY = NETY = NWBY = NEBY = 0
    SWTY = SETY = SWBY = SEBY = 0

    NWTZ = NETZ = NWBZ = NEBZ = 0
    SWTZ = SETZ = SWBZ = SEBZ = 0

    for z in range(DK):
        for y in range(DJ):
            for x in range(DI):
                NWTX += 1
                NETX += 1
                grid_cut.append(Dvd_grid[0][NWTX - 1])
                cont += 1
                grid_cut.append(Dvd_grid[1][NETX - 1])
                cont += 1

            for x in range(DI):
                SWTX += 1
                SETX += 1
                grid_cut.append(Dvd_grid[2][SWTX - 1])
                cont += 1
                grid_cut.append(Dvd_grid[3][SETX - 1])
                cont += 1

        for y in range(DJ):
            for x in range(DI):
                NWBX += 1
                NEBX += 1
                grid_cut.append(Dvd_grid[4][NWBX - 1])
                cont += 1
                grid_cut.append(Dvd_grid[5][NEBX - 1])
                cont += 1

            for x in range(DI):
                SWBX += 1
                SEBX += 1
                grid_cut.append(Dvd_grid[6][SWBX - 1])
                cont += 1
                grid_cut.append(Dvd_grid[7][SEBX - 1])
                cont += 1

    for z in range(DK):
        for y in range(DJ):
            for x in range(DI):
                NWTY += 1
                NETY += 1
                grid_cut.append(Dvd_grid[8][NWTY - 1])
                cont += 1
                grid_cut.append(Dvd_grid[9][NETY - 1])
                cont += 1

            for x in range(DI):
                SWTY += 1
                SETY += 1
                grid_cut.append(Dvd_grid[10][SWTY - 1])
                cont += 1
                grid_cut.append(Dvd_grid[11][SETY - 1])
                cont += 1

        for y in range(DJ):
            for x in range(DI):
                NWBY += 1
                NEBY += 1
                grid_cut.append(Dvd_grid[12][NWBY - 1])
                cont += 1
                grid_cut.append(Dvd_grid[13][NEBY - 1])
                cont += 1

            for x in range(DI):
                SWBY += 1
                SEBY += 1
                grid_cut.append(Dvd_grid[14][SWBY - 1])
                cont += 1
                grid_cut.append(Dvd_grid[15][SEBY - 1])
                cont += 1

    for z in range(DK):
        for y in range(DJ):
            for x in range(DI):
                NWTZ += 1
                NETZ += 1
                grid_cut.append(Dvd_grid[16][NWTZ - 1])
                cont += 1
                grid_cut.append(Dvd_grid[17][NETZ - 1])
                cont += 1

            for x in range(DI):
                SWTZ += 1
                SETZ += 1
                grid_cut.append(Dvd_grid[18][SWTZ - 1])
                cont += 1
                grid_cut.append(Dvd_grid[19][SETZ - 1])
                cont += 1

        for y in range(DJ):
            for x in range(DI):
                NWBZ += 1
                NEBZ += 1
                grid_cut.append(Dvd_grid[20][NWBZ - 1])
                cont += 1
                grid_cut.append(Dvd_grid[21][NEBZ - 1])
                cont += 1

            for x in range(DI):
                SWBZ += 1
                SEBZ += 1
                grid_cut.append(Dvd_grid[22][SWBZ - 1])
                cont += 1
                grid_cut.append(Dvd_grid[23][SEBZ - 1])
                cont += 1

    return grid_cut
