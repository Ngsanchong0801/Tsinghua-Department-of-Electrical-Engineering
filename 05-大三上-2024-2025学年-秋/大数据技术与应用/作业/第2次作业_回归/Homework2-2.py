from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, Lasso
from sklearn.preprocessing import PolynomialFeatures, StandardScaler
from sklearn.metrics import mean_squared_error, r2_score
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve
import numpy as np


def plot_learning_curve(model, X, y, title):
    train_sizes, train_scores, test_scores = learning_curve(model, X, y, cv=5, n_jobs=-1,
                                                            train_sizes=np.linspace(0.01, 1.0, 1000),
                                                            scoring="neg_mean_squared_error")
    train_scores_mean = -np.mean(train_scores, axis=1)
    test_scores_mean = -np.mean(test_scores, axis=1)

    plt.figure()
    plt.plot(train_sizes, train_scores_mean, color="r", label="Training error", lw=1)
    plt.plot(train_sizes, test_scores_mean,  color="g", label="Validation error", lw=1)
    plt.title(title)
    plt.xlabel("Training examples")
    plt.ylabel("Error")
    plt.legend(loc="best")
    plt.grid(True)
    plt.show()


# 加载数据集
data = pd.read_csv("E:/Python/Project/Big Data Technology and Applications/Homework2/hw2_3gpf.csv")

# 分离特征和目标变量
X = data.iloc[:, :-1]  # 前25列为特征
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

# 打印线性回归结果
print("线性回归模型 (lr) \n均方误差(MSE):", mse_lr, "\n决定系数(R²):", r2_lr)

# 2. 多项式回归模型 (lr2)
poly = PolynomialFeatures(degree=2)  # 使用二次多项式
X_train_poly = poly.fit_transform(X_train_scaled)
X_test_poly = poly.transform(X_test_scaled)

poly_model = LinearRegression()
poly_model.fit(X_train_poly, y_train)
y_pred_poly = poly_model.predict(X_test_poly)
mse_poly = mean_squared_error(y_test, y_pred_poly)
r2_poly = r2_score(y_test, y_pred_poly)

# 打印多项式回归结果
print("\n多项式回归模型 (lr2) \n均方误差(MSE):", mse_poly, "\n决定系数(R²):", r2_poly)

# 3. Lasso 回归模型 (ls)
lasso_model = Lasso(alpha=0.1)  # 使用 L1 正则化
lasso_model.fit(X_train_scaled, y_train)
y_pred_ls = lasso_model.predict(X_test_scaled)
mse_ls = mean_squared_error(y_test, y_pred_ls)
r2_ls = r2_score(y_test, y_pred_ls)

# 打印 Lasso 回归结果
print("\nLasso 回归模型 (ls) \n均方误差(MSE):", mse_ls, "\n决定系数(R²):", r2_ls)

# 可视化 - 实际值 vs 预测值 (线性回归)
plt.figure(figsize=(10, 6))
plt.scatter(y_test, y_pred_lr, color='blue', label='Predicted (Linear)')
plt.plot([min(y_test), max(y_test)], [min(y_test), max(y_test)], color='red', lw=2, label='Actual')
plt.title('Linear Regression - Actual vs Predicted')
plt.xlabel('Actual Stability Margin')
plt.ylabel('Predicted Stability Margin')
plt.legend()
plt.grid(True)
plt.show()

# 可视化 - 实际值 vs 预测值 (多项式回归)
plt.figure(figsize=(10, 6))
plt.scatter(y_test, y_pred_poly, color='green', label='Predicted (Polynomial)')
plt.plot([min(y_test), max(y_test)], [min(y_test), max(y_test)], color='red', lw=2, label='Actual')
plt.title('Polynomial Regression - Actual vs Predicted')
plt.xlabel('Actual Stability Margin')
plt.ylabel('Predicted Stability Margin')
plt.legend()
plt.grid(True)
plt.show()

# 可视化 - 实际值 vs 预测值 (Lasso 回归)
plt.figure(figsize=(10, 6))
plt.scatter(y_test, y_pred_ls, color='purple', label='Predicted (Lasso)')
plt.plot([min(y_test), max(y_test)], [min(y_test), max(y_test)], color='red', lw=2, label='Actual')
plt.title('Lasso Regression - Actual vs Predicted')
plt.xlabel('Actual Stability Margin')
plt.ylabel('Predicted Stability Margin')
plt.legend()
plt.grid(True)
plt.show()

# 绘制线性回归模型的学习曲线
plot_learning_curve(LinearRegression(), X_train_scaled, y_train, "Learning Curve - Linear Regression")

# 绘制多项式回归模型的学习曲线
plot_learning_curve(LinearRegression(), X_train_poly, y_train, "Learning Curve - Polynomial Regression")

# 绘制Lasso回归模型的学习曲线
plot_learning_curve(Lasso(alpha=0.1), X_train_scaled, y_train, "Learning Curve - Lasso Regression")
