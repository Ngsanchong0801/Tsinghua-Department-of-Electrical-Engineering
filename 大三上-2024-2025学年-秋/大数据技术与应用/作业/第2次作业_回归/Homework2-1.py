from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, Lasso
from sklearn.preprocessing import PolynomialFeatures, StandardScaler
from sklearn.metrics import mean_squared_error, r2_score
import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("E:/Python/Project/Big Data Technology and Applications/Homework2/hw2_3gpf.csv")

# 分离特征和目标变量
X = data.iloc[:, :-1]  # 前25列为特 征
y = data.iloc[:, -1]  # 最后一列为目标变量 (Margin)

# 将数据集拆分为训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

# 对特征进行标准化处理
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# 1. 线性回归模型 (lr)
linear_model = LinearRegression()
linear_model.fit(X_train_scaled, y_train)
y_pred_lr = linear_model.predict(X_test_scaled)
mse_lr = mean_squared_error(y_test, y_pred_lr)
r2_lr = r2_score(y_test, y_pred_lr)

# 打印结果
print("线性回归模型 (lr) \n均方误差(MSE):", mse_lr, "\n决定系数(R²):", r2_lr)

# 绘制实际值 vs 预测值的散点图
plt.figure(figsize=(10, 6))
plt.scatter(y_test, y_pred_lr, color='blue', label='Predicted')
plt.plot([min(y_test), max(y_test)], [min(y_test), max(y_test)], color='red', lw=2, label='Actual')
plt.title('Linear Regression Model - Actual vs Predicted')
plt.xlabel('Actual Stability Margin')
plt.ylabel('Predicted Stability Margin')
plt.legend()
plt.grid(True)
plt.show()


