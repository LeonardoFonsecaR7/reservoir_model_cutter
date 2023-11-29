import os
import sys
import numpy as np
import logging.config
from functions import grid_tools
from functions.the_cutter import cutter
from functions.save_inc_file import save_as_inc_file_reshaped


def main(
    folder_dir: str = None,
    og_dimentions: tuple = (),
    new_dimentions: tuple = (),
    ref_corner: tuple = (),
):
    og_x, og_y, og_z = og_dimentions
    new_x, new_y, new_z = new_dimentions

    logging.info("Start Reservoir Model Cutter")
    logging.info(f"Original dimentions: {og_dimentions}")
    logging.info(f"New dimentions: {new_dimentions}")
    logging.info(f"Cell reference to cut: {ref_corner}")

    files = os.listdir(folder_dir)

    for filename in files:
        with open(os.getcwd() + "/input/" + filename, "r") as file:
            lines = file.readlines()

        logging.info(f"Starting file {filename}")

        data = []

        for line in lines:
            if "\t" in line:
                row = line.strip().split("\t")
            else:
                row = line.strip().split(" ")
            for value in row:
                if "*" in value:
                    mult = int(value.split("*")[0])
                    var = float(value.split("*")[1])
                    values = [var] * mult
                    for var in values:
                        data.append(float(var))
                else:
                    data.append(float(value))

        flag_grid_file = True if og_x * og_y * og_z * 24 == len(data) else False

        if flag_grid_file:
            grid_datasets = grid_tools.reader(data, og_x, og_y, og_z)
            new_grid_dataset = []
            for grid in grid_datasets:
                new_grid_dataset.append(
                    cutter(
                        grid,
                        og_dimentions,
                        new_dimentions,
                        ref_corner,
                    )
                )
            new_data = grid_tools.group(new_grid_dataset, new_x, new_y, new_z)

        else:
            new_data = cutter(data, og_dimentions, new_dimentions, ref_corner)

        save_as_inc_file_reshaped(
            new_data, f"output/{new_x}_{new_y}_{new_z}/{filename}", elements_per_row=20
        )

        logging.info(f"Save cutter file in {os.getcwd()}/output/{new_x}_{new_y}_{new_z} directory \n")
    logging.info("Reservoir model cutter finish")


if __name__ in "__main__":
    logging.config.fileConfig("logging_config.ini")

    main(
        folder_dir="/Users/leonardofonseca/Documents/work/master/codes/reservoir_model_cutter/src/input",
        og_dimentions=(46, 69, 30),
        new_dimentions=(17, 10, 11),
        ref_corner=(0, 0, 0),
    )
