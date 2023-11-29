import numpy as np


def cutter(data, og_size, new_size, corner):
    x, y, z = og_size

    nx, ny, nz = new_size

    cx, cy, cz = corner

    data = np.array(data).reshape(z, y, x)

    cut_data =  data[cz : cz + nz, cy : cy + ny, cx : cx + nx]
    
    return cut_data.flatten()
    
