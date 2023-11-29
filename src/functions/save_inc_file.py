import os

def save_as_inc_file_reshaped(data_list, file_path, elements_per_row):
    # Create the directory if it doesn't exist
    directory = os.path.dirname(file_path)
    os.makedirs(directory, exist_ok=True)

    with open(file_path, "w") as file:
        for i in range(0, len(data_list), elements_per_row):
            row = data_list[i : i + elements_per_row]
            file.write(" ".join(map(str, row)) + "\n")
