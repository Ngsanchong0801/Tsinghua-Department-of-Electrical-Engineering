from __future__ import print_function

import os
import json
from sklearn.preprocessing import MinMaxScaler
import pandas as pd
import numpy as np
import torch
import torch.optim as optim
import torch.utils.data
from Data_Solver.reshape_data import reshape_data
from Data_Solver.to_supervised import to_surpervised
from Data_Solver.quantile_loss import QuantileLoss
from Data_Solver.data_loader import DataLoader
from Model.lstm import LSTM
import matplotlib.pyplot as plt

PATH = 'rnnmodel.pt'
quantiles = [0.5]
input_size = 20
hidden_size = 50
number_layer = 1
batch_size = 32
epoch = 2
input_layer = 48
output_layer = len(quantiles)
output_size = 24
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
train_loss = []
validation_loss = []
task1_train_start = 35064

def plot_results(prediction_list, true_data):
    fig = plt.figure(facecolor='white')
    ax = fig.add_subplot(111)
    ax.plot(true_data[0:720], label='True Data')
    for i in range(len(prediction_list)):
        plt.plot(prediction_list[i][0:720], label='Prediction')
    plt.legend()
    plt.show()


def pre_train():
    print("reading file")
    configs = json.load(open('config.json', 'r'))
    data = DataLoader(
        os.path.join(configs['data']['filename']),
        configs['data']['train_test_split'],
        configs['data']['columns'],
        task1_train_start
    )
    scaler = MinMaxScaler()
    scaler.fit(data.data_train)
    loss_function = QuantileLoss(quantiles)
    train_data = reshape_data(scaler.transform(data.data_train), 0)
    x, y = to_surpervised(train_data, input_layer, output_size, 'train')
    x = torch.tensor(x, dtype=torch.float32).to(device)
    y = torch.tensor(y, dtype=torch.float32).to(device)
    validation_data = reshape_data(scaler.transform(data.data_test), 1)
    x_validation, y_validation = to_surpervised(validation_data, input_layer, output_size, 'validation')
    x_validation = torch.tensor(x_validation, dtype=torch.float32).to(device)
    y_validation = torch.tensor(y_validation, dtype=torch.float32).to(device)
    y_validation = y_validation.view(-1, 1)

    model = LSTM(input_size, hidden_size, number_layer, output_size, output_layer).to(device)
    optimizer = optim.SGD(model.parameters(), lr=0.1, momentum=0.2)
    model.train(device, (x, y), (x_validation, y_validation), loss_function, optimizer, batch_size, epoch, train_loss,
                validation_loss, scaler)
    plt.plot(train_loss)
    plt.plot(validation_loss)
    plt.xlabel('epoch')
    plt.ylabel('loss')
    plt.legend(['train', 'validation'], loc='upper left')
    plt.show()
    # torch.save(model.state_dict(), PATH)
    predictions = model.off_predict(x_validation)
    prediction_list = []
    for i in range(output_layer):
        prediction_list.append(scaler.inverse_transform(predictions[:, :, i].cpu().detach().numpy()))
    prediction_inv = scaler.inverse_transform(predictions.view(-1, 1).cpu().detach().numpy())
    y_validation_inv = scaler.inverse_transform(y_validation.cpu().detach().numpy())
    plot_results(prediction_list, y_validation_inv)
    print("loss: {}".format(loss_function(torch.tensor(prediction_inv).view(-1, 1, output_layer), torch.tensor(y_validation_inv))))

if __name__ == '__main__':
    pre_train()
