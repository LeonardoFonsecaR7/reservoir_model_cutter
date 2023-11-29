import logging

def get_log ():
    # Configure logging
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s | %(levelname)s | %(message)s",
        handlers=[
            logging.StreamHandler(),  # Output to console
            #logging.FileHandler("example.log"),  # Output to file
        ],
    )

    return logging
