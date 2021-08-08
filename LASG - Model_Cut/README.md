===========================================================================
==                                                                       ==
==                         LASG - CMG Grid Cut                           ==
==                                                                       ==  
===========================================================================


                            How to use the tool:
___________________________________________________________________________

The cut algorithm contains 6 files, which are:
    1 - MAIN.m
    2 - INC2CELL.m
    3 - creatarray.m
    4 - blockreader.m
    5 - Cut_grid.m
    6 - Agrup_grid.m

To execute the algorithm, the files to be read must follow some conditions:

  - The file must be saved as an INCLUDE file ".inc", containing only the 
    values of the grid property, without any keyword;

  - The files to be cut must be in the same folder as the files of the 
    LASG - CMG cut.

To perform the cut, you must initially create a array - cells whit size =
2 x number of files to be cut, for example to cut 3 files:

In command Window, type:
                           VPR = cell (2,3); 

In Workspace, edit the line 1 of this array the name of each include file
that will be cut, example:

                    VPR = ['POR'] ['PERM'] ['GRID']
                            []       []       []

The second line of the array will be in with the empty cells initially;
The files must be written with "quotes" to locate the correct file.

Now, you must execute the MAIN function, with the created array, 
in Command Window, type:

                            VPR = MAIN (VPR);

When running the algorithm, some messages about the current model and its
new dimensions will appear in the Command Window. It is necessary that you
write all the values between "brackets" and separated by "comma".

For example, an initial size model of 20x20x10 will be cut to 10x10x5, 
with corner at x = 3 and y = 4 and z from 6 to 10:

            Enter CURRENT grid size [X, Y, Z]: [20,20,10]

        Enter the dimension of the NEW grid [X, Y, Z]: [10,10,5]

Enter the range of layers in "z" that you want to cut [TOP, BASE]: [6,10]

            Enter the CORNER you want to cut [X, Y]: [3,4]

OBS: 
    - If the value of 'Z' in the cut is equal to the initial value, the
      algorithm will not cut in 'Z' and the top and base message of the
      'Z' axis will not appear;

    - If the property is the "corner point", the number of values of this
      property will be different than the other parameters. The grid has
      the coordinates of the verticies of each cell (8 parameters) in 3
      directions, so if the model had 10x10x5, there are 250 parameters 
      for each cell and 6000 coordinates for the grid.

________________________________________________________________________

                                RESULT
    The results of the cut will appear in the second line of the array
    created previously, relating each file name to the cell below with
    its new dimension.

             VPR = ['POR.inc']     ['PERM.inc']    ['GRID.inc']
                   [1x250 double]  [1x250 double]  [1x6000 double]





