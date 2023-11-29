import os
import sys
import argparse
import logging.config
from functions import grid_tools
from functions.the_cutter import cutter
from functions.save_inc_file import save_as_inc_file_reshaped


def parse_arguments():
    parser = argparse.ArgumentParser(description="Reservoir Model Cutter")

    parser.add_argument(
        "--folder_dir",
        type=str,
        required=True,
        help="Path to the directory containing input files.",
    )

    parser.add_argument(
        "--og_dimensions",
        type=int,
        nargs=3,
        required=True,
        help="Original dimensions of the reservoir model (x, y, z).",
    )

    parser.add_argument(
        "--new_dimensions",
        type=int,
        nargs=3,
        required=True,
        help="New dimensions for the extracted model (x, y, z).",
    )

    parser.add_argument(
        "--ref_corner",
        type=int,
        nargs=3,
        required=True,
        help="Reference corner coordinates for the extraction.",
    )

    return parser.parse_args()


def main():
    args = parse_arguments()
    folder_dir = args.folder_dir
    og_dimensions = tuple(args.og_dimensions)
    new_dimensions = tuple(args.new_dimensions)
    ref_corner = tuple(args.ref_corner)

    og_x, og_y, og_z = og_dimensions
    new_x, new_y, new_z = new_dimensions

    logging.info("Start Reservoir Model Cutter")
    logging.info(f"Original dimentions: {og_dimensions}")
    logging.info(f"New dimentions: {new_dimensions}")
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
                        og_dimensions,
                        new_dimensions,
                        ref_corner,
                    )
                )
            new_data = grid_tools.group(new_grid_dataset, new_x, new_y, new_z)

        else:
            new_data = cutter(data, og_dimensions, new_dimensions, ref_corner)

        save_as_inc_file_reshaped(
            new_data, f"output/{new_x}_{new_y}_{new_z}/{filename}", elements_per_row=20
        )

        logging.info(
            f"Save cutter file in {os.getcwd()}/output/{new_x}_{new_y}_{new_z} directory \n"
        )
    logging.info("Reservoir model cutter finish")


if __name__ in "__main__":
    logging.config.fileConfig("logging_config.ini")

    main(
        # folder_dir="/Users/leonardofonseca/Documents/work/master/codes/reservoir_model_cutter/src/input",
        # og_dimentions=(46, 69, 30),
        # new_dimentions=(17, 10, 11),
        # ref_corner=(0, 0, 0),
    )
