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
batch_size = 16  # 将批次大小设置为 16
epoch = 2  # 将训练轮数设置为 2
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
        configs['data']['train_split'],
        configs['data']['validation_split'],
        configs['data']['columns'],
        task1_train_start
    )
    scaler = MinMaxScaler()
    scaler.fit(data.data_train)
    loss_function = QuantileLoss(quantiles)

    # 训练集和验证集预处理
    train_data = reshape_data(scaler.transform(data.data_train), 0)
    x, y = to_surpervised(train_data, input_layer, output_size, 'train')
    x = torch.tensor(x, dtype=torch.float32).to(device)
    y = torch.tensor(y, dtype=torch.float32).to(device)

    validation_data = reshape_data(scaler.transform(data.data_validation), 1)
    x_validation, y_validation = to_surpervised(validation_data, input_layer, output_size, 'validation')
    x_validation = torch.tensor(x_validation, dtype=torch.float32).to(device)
    y_validation = torch.tensor(y_validation, dtype=torch.float32).to(device)
    y_validation = y_validation.view(-1, 1)

    # 测试集预处理
    test_data = reshape_data(scaler.transform(data.data_test), 2)
    x_test, y_test = to_surpervised(test_data, input_layer, output_size, 'validation')
    x_test = torch.tensor(x_test, dtype=torch.float32).to(device)
    y_test = torch.tensor(y_test, dtype=torch.float32).to(device)
    y_test = y_test.view(-1, 1)

    # 优化器设置为 Adam，学习率设置为 0.01
    model = LSTM(input_size, hidden_size, number_layer, output_size, output_layer).to(device)
    optimizer = optim.Adam(model.parameters(), lr=0.01)

    # 模型训练
    model.train(device, (x, y), (x_validation, y_validation), loss_function, optimizer, batch_size, epoch, train_loss,
                validation_loss, scaler)

    # 绘制训练和验证损失曲线
    plt.plot(train_loss)
    plt.plot(validation_loss)
    plt.xlabel('epoch')
    plt.ylabel('loss')
    plt.legend(['train', 'validation'], loc='upper left')
    plt.show()

    # 在验证集上绘制预测结果
    predictions = model.off_predict(x_validation)
    prediction_list = []
    for i in range(output_layer):
        prediction_list.append(scaler.inverse_transform(predictions[:, :, i].cpu().detach().numpy()))
    prediction_inv = scaler.inverse_transform(predictions.view(-1, 1).cpu().detach().numpy())
    y_validation_inv = scaler.inverse_transform(y_validation.cpu().detach().numpy())
    plot_results(prediction_list, y_validation_inv)
    print("Validation loss: {}".format(
        loss_function(torch.tensor(prediction_inv).view(-1, 1, output_layer), torch.tensor(y_validation_inv))))

    # 测试集上的预测精度评估
    model.eval()  # 设置模型为评估模式
    with torch.no_grad():
        test_predictions = model.off_predict(x_test)
        test_prediction_list = []
        for i in range(output_layer):
            test_prediction_list.append(scaler.inverse_transform(test_predictions[:, :, i].cpu().numpy()))
        test_prediction_inv = scaler.inverse_transform(test_predictions.view(-1, 1).cpu().numpy())
        y_test_inv = scaler.inverse_transform(y_test.cpu().numpy())

    # 绘制测试集结果
    plot_results(test_prediction_list, y_test_inv)

    # 计算并打印测试集损失
    test_loss = loss_function(torch.tensor(test_prediction_inv).view(-1, 1, output_layer), torch.tensor(y_test_inv))
    print("Test loss: {}".format(test_loss.item()))


if __name__ == '__main__':
    pre_train()
