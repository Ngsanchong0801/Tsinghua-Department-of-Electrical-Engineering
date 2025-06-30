import numpy as np
import itertools
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPRegressor
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings("ignore")  # 可选：隐藏收敛警告

# 数据定义
S_i = np.array([2040, 1646, 1725, 1652, 1508, 1687, 980, 864, 865, 2100])
D_i = np.array([2.7, 2.9, 2.1, 2.5, 2.7, 2.6, 2.4, 2.8, 2.2, 2.6])
K_Gi = np.array([15, 16, 22, 21, 20, 28, 23, 17, 18, 21])
T_ji = np.array([15, 14, 13, 13, 15, 15, 10, 9, 9, 15])
S_sys = np.sum(S_i)
T_R = 12
F_R = 0.35
Delta_P_L = 100

# 所有组合 u ∈ {0,1}^10
u_matrix = np.array(list(itertools.product([0, 1], repeat=10)))

def calc_weighted_average(u, values):
    return np.sum(u * S_i * values) / S_sys

def calc_f_nadir(u):
    T_j = calc_weighted_average(u, T_ji)
    K_G = calc_weighted_average(u, K_Gi)
    D = calc_weighted_average(u, D_i)
    if T_j <= 0 or (D + K_G) == 0:
        return None
    try:
        term_sqrt = np.sqrt((K_G * T_R) / T_j)
        exponent = (T_j + D * T_R) / (2 * T_j * T_R)
        df = -Delta_P_L / (D + K_G) * (1 + term_sqrt * np.exp(exponent))
        return df if np.isfinite(df) else None
    except:
        return None

# 构建干净数据集
X_clean, y_clean = [], []
for u in u_matrix:
    y_val = calc_f_nadir(u)
    if y_val is not None:
        X_clean.append(u)
        y_clean.append(y_val)

X_clean = np.array(X_clean)
y_clean = np.array(y_clean)

# 标准化输入
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X_clean)

# 拆分数据集
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y_clean, test_size=0.2, random_state=42)

# 建模：解决收敛问题（提高迭代次数 + 标准化）
model = MLPRegressor(
    hidden_layer_sizes=(128, 64, 32),
    activation='relu',
    solver='lbfgs',
    learning_rate_init=0.001,
    max_iter=3000,
    early_stopping=True,
    validation_fraction=0.1,
    n_iter_no_change=10,
    random_state=42
)
model.fit(X_train, y_train)

# 预测与误差
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print(f"标准化后模型测试集 MSE: {mse:.4f}")

# 原始顺序绘图
plt.figure(figsize=(10, 6))
plt.plot(y_test, label='True Δf_nadir', marker='o')
plt.plot(y_pred, label='Predicted Δf_nadir', marker='x')
plt.title(f'Original Prediction (MSE = {mse:.4f})')
plt.xlabel('Test Sample Index')
plt.ylabel('Δf_nadir')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# 排序后拟合曲线绘图
sorted_indices = np.argsort(y_test)
y_test_sorted = np.array(y_test)[sorted_indices]
y_pred_sorted = np.array(y_pred)[sorted_indices]
mse_sorted = mean_squared_error(y_test_sorted, y_pred_sorted)

plt.figure(figsize=(10, 6))
plt.plot(y_test_sorted, label='True Δf_nadir', linestyle='-', marker='o')
plt.plot(y_pred_sorted, label='Predicted Δf_nadir', linestyle='--', marker='x')
plt.title(f'Fit Curve (Sorted) - MSE = {mse_sorted:.4f}')
plt.xlabel('Sorted Test Sample Index')
plt.ylabel('Δf_nadir')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
