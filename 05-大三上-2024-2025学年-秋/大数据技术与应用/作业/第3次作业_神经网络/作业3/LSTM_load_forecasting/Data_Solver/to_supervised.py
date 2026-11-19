import numpy as np


def to_surpervised(train, n_input=48, n_out=24, flag='train'):
    train_x , train_y = list(), list()
    in_start = 0
    for _ in range(len(train)):
        in_end = in_start + n_input
        out_end = in_end + n_out
        if out_end < len(train):
            train_x.append(train[in_start: in_end, :])
            train_y.append(train[in_end: out_end, 0])
        if flag == 'train':
            in_start += 1
        elif flag == 'validation':
            in_start += n_out
    return np.asarray(train_x), np.asarray(train_y)