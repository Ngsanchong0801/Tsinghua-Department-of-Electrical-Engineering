import pandas as pd
from Data_Solver.reshape_data import reshape_data

class DataLoader:
    """A class for loading and transforming data for the lstm model"""

    def __init__(self, filename, train_split, validation_split, cols, start):
        dataframe = pd.read_csv(filename)
        dataframe = dataframe[start:]
        i_split_train = int(len(dataframe) * train_split)
        i_split_val = i_split_train + int(len(dataframe) * validation_split)
        self.data_train = dataframe.get(cols).values[:i_split_train]
        self.data_validation = dataframe.get(cols).values[i_split_train:i_split_val]
        self.data_test = dataframe.get(cols).values[i_split_val:]
        self.len_train = len(self.data_train)
        self.len_validation = len(self.data_validation)
        self.len_test = len(self.data_test)
