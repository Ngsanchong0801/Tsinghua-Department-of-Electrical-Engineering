import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

# 加载数据
data = np.array(pd.read_csv('hw4_data.csv'))
X = data[:, 0:1321]  # 特征矩阵
Y = data[:, 1322]  # 标签

# 特征工程：合并有功与无功功率，生成视在功率
def transform_features(X_train, X_test):
    X_train_transformed = np.copy(X_train)
    X_test_transformed = np.copy(X_test)
    for i in range(578, 764):
        X_train_transformed[:, i] = np.sqrt(X_train[:, i] ** 2 + X_train[:, i + 186] ** 2)
        X_test_transformed[:, i] = np.sqrt(X_test[:, i] ** 2 + X_test[:, i + 186] ** 2)
    return X_train_transformed, X_test_transformed

# 训练决策树并计算误差
def train_and_evaluate(X_train, X_test, Y_train, Y_test, X_train_transformed, X_test_transformed, max_depth):
    # 初始化模型
    model1 = DecisionTreeClassifier(criterion='entropy', max_depth=max_depth)
    model2 = DecisionTreeClassifier(criterion='entropy', max_depth=max_depth)

    # 训练模型
    model1.fit(X_train, Y_train)
    model2.fit(X_train_transformed, Y_train)

    # 获取预测结果
    Y1_pred = model1.predict(X_test)
    Y1_train_pred = model1.predict(X_train)
    Y2_pred = model2.predict(X_test_transformed)
    Y2_train_pred = model2.predict(X_train_transformed)

    # 计算混淆矩阵
    m1_test = confusion_matrix(Y_test, Y1_pred)
    m1_train = confusion_matrix(Y_train, Y1_train_pred)
    m2_test = confusion_matrix(Y_test, Y2_pred)
    m2_train = confusion_matrix(Y_train, Y2_train_pred)

    # 计算误差
    train_err = (m1_train[0, 1] + m1_train[1, 0]) / len(Y_train)
    test_err = (m1_test[0, 1] + m1_test[1, 0]) / len(Y_test)
    train_err_transformed = (m2_train[0, 1] + m2_train[1, 0]) / len(Y_train)
    test_err_transformed = (m2_test[0, 1] + m2_test[1, 0]) / len(Y_test)

    # 计算精度
    precision1 = m1_test[1, 1] / (m1_test[0, 1] + m1_test[1, 1]) if (m1_test[0, 1] + m1_test[1, 1]) != 0 else 0
    precision2 = m2_test[1, 1] / (m2_test[0, 1] + m2_test[1, 1]) if (m2_test[0, 1] + m2_test[1, 1]) != 0 else 0

    return train_err, test_err, train_err_transformed, test_err_transformed, precision1, precision2

# 数据集划分并计算误差
test_sizes = np.linspace(0.1, 0.9, 15)  # 从10%到90%不等的测试集比例

train_err_list = []
test_err_list = []
train_err_transformed_list = []
test_err_transformed_list = []

# 处理不同的测试集比例
for test_size in test_sizes:
    # 划分训练集和测试集
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=test_size)

    # 特征工程
    X_train_transformed, X_test_transformed = transform_features(X_train, X_test)

    # 训练并评估模型
    train_err, test_err, train_err_transformed, test_err_transformed, _, _ = train_and_evaluate(
        X_train, X_test, Y_train, Y_test, X_train_transformed, X_test_transformed, max_depth=5)

    # 记录误差
    train_err_list.append(train_err)
    test_err_list.append(test_err)
    train_err_transformed_list.append(train_err_transformed)
    test_err_transformed_list.append(test_err_transformed)

# 绘制训练集误差和测试集误差曲线（根据不同测试集比例）
plt.figure(figsize=(10, 5))
plt.plot(1 - test_sizes, train_err_list, label='Train Error (Raw)')
plt.plot(1 - test_sizes, test_err_list, label='Test Error (Raw)')
plt.plot(1 - test_sizes, train_err_transformed_list, label='Train Error (Transformed)')
plt.plot(1 - test_sizes, test_err_transformed_list, label='Test Error (Transformed)')

plt.xlabel('Training Set Size (1 - test_size)')
plt.ylabel('Error Rate')
plt.title('Train and Test Errors vs Training Set Size')
plt.legend()
plt.grid(True)
plt.show()

# 选择一个具体的测试集比例（例如40%）
test_size = 0.4
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=test_size)

# 特征工程
X_train_transformed, X_test_transformed = transform_features(X_train, X_test)

# 处理不同的决策树深度（max_depth）
K = np.arange(2, 10)

train_err_list_depth = []
test_err_list_depth = []
train_err_transformed_list_depth = []
test_err_transformed_list_depth = []
precision1_list_depth = []
precision2_list_depth = []

# 遍历不同的决策树深度（max_depth）
for k in K:
    # 训练并评估模型
    train_err, test_err, train_err_transformed, test_err_transformed, precision1, precision2 = train_and_evaluate(
        X_train, X_test, Y_train, Y_test, X_train_transformed, X_test_transformed, max_depth=k)

    # 记录误差和精度
    train_err_list_depth.append(train_err)
    test_err_list_depth.append(test_err)
    train_err_transformed_list_depth.append(train_err_transformed)
    test_err_transformed_list_depth.append(test_err_transformed)
    precision1_list_depth.append(precision1)
    precision2_list_depth.append(precision2)

# 绘制训练误差和测试误差曲线（根据决策树深度）
plt.figure(figsize=(10, 5))
plt.plot(K, train_err_list_depth, label='trainError')
plt.plot(K, test_err_list_depth, label='testError')
plt.plot(K, train_err_transformed_list_depth, label='trainError_transformed')
plt.plot(K, test_err_transformed_list_depth, label='testError_transformed')
plt.xlabel('Max Depth (k)')
plt.ylabel('Error Rate')
plt.title('Training and Testing Errors vs Tree Depth')
plt.legend()
plt.grid(True)
plt.show()

# 绘制精度曲线（根据决策树深度）
plt.figure(figsize=(10, 5))
plt.plot(K, precision1_list_depth, label='Precision1')
plt.plot(K, precision2_list_depth, label='Precision2')
plt.xlabel('Max Depth (k)')
plt.ylabel('Precision')
plt.title('Precision vs Tree Depth')
plt.legend()
plt.grid(True)
plt.show()
