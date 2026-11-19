import pandas as pd
from Data_Solver.reshape_data import reshape_data


class DataLoader:
    """A class for loading and transforming data for the lstm model"""

    def __init__(self, filename, split, cols, start):
        dataframe = pd.read_csv(filename)
        dataframe = dataframe[start:]
        i_split = int(len(dataframe) * split)
        self.data_train = dataframe.get(cols).values[:i_split]
        self.data_test  = dataframe.get(cols).values[i_split:]
        self.len_train  = len(self.data_train)
        self.len_test   = len(self.data_test)
        self.len_train_windows = None
