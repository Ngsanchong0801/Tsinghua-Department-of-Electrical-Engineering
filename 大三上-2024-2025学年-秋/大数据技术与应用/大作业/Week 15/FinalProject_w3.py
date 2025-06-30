from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score
import sqlite3
import pandas as pd
import time
import logging

# 设置日志记录器
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
# 记录程序开始的时间
start_time = time.time()

# 连接到数据库并读取数据
def load_data(database, limit=None, condition=None):
    logger.info(f"Loading data from {database}...")
    conn = sqlite3.connect(database)

    # 基础查询语句
    query = "SELECT * FROM Gen"
    if condition:
        query += f" WHERE {condition}"

    if limit:
        query += f" LIMIT {limit}"

    # 读取机组表
    gen_df = pd.read_sql(query, conn)
    demand_df = pd.read_sql(query.replace('Gen', 'Demand'), conn)

    # 仅在包含 Price 表的数据库中读取 Price 数据
    price_df = None
    if 'Price' in pd.read_sql("SELECT name FROM sqlite_master WHERE type='table'", conn).values:
        price_df = pd.read_sql(query.replace('Gen', 'Price'), conn)

    conn.close()
    logger.info(f"Data loaded successfully from {database}.")  # 日志记录
    return gen_df, demand_df, price_df

best_limit =0
best_Mean_SquaredError=10000

# 读取預測集数据
gen_test, demand_test, _ = load_data('test_input_w3.db')

# 读取2021和2022年的数据，限制加载的行数
# for limit in range(100, 10000, 10):  # 从100到1000，步长为10
#     gen_2021, demand_2021, price_2021 = load_data('data_2021.db', limit=limit)  # 加载前xxxx行
#     gen_2022, demand_2022, price_2022 = load_data('data_2022.db', limit=limit)  # 加载前xxxx行
#     logger.info(f"limit: {limit} ")

gen_2021, demand_2021, price_2021 = load_data('data_2021.db', limit=1200)  # 加载前xxxx行
gen_2022, demand_2022, price_2022 = load_data('data_2022.db', limit=1200)  # 加载前xxxx行

# 处理时间列
gen_2021['time'] = pd.to_datetime(gen_2021['time'], errors='coerce')
demand_2021['time'] = pd.to_datetime(demand_2021['time'], errors='coerce')
if price_2021 is not None:
    price_2021['time'] = pd.to_datetime(price_2021['time'], errors='coerce')

gen_2022['time'] = pd.to_datetime(gen_2022['time'], errors='coerce')
demand_2022['time'] = pd.to_datetime(demand_2022['time'], errors='coerce')
if price_2022 is not None:
    price_2022['time'] = pd.to_datetime(price_2022['time'], errors='coerce')

gen_test['time'] = pd.to_datetime(gen_test['time'], errors='coerce')
demand_test['time'] = pd.to_datetime(demand_test['time'], errors='coerce')

# 填充缺失值
gen_2021.ffill(inplace=True)
demand_2021.ffill(inplace=True)
if price_2021 is not None:
    price_2021.ffill(inplace=True)

gen_2022.ffill(inplace=True)
demand_2022.ffill(inplace=True)
if price_2022 is not None:
    price_2022.ffill(inplace=True)

gen_test.ffill(inplace=True)
demand_test.ffill(inplace=True)

# 合并数据
merged_2021 = pd.merge(gen_2021, demand_2021, on=['region', 'time'], how='inner')
if price_2021 is not None:
    merged_2021 = pd.merge(merged_2021, price_2021, on=['region', 'time'], how='inner')

merged_2022 = pd.merge(gen_2022, demand_2022, on=['region', 'time'], how='inner')
if price_2022 is not None:
    merged_2022 = pd.merge(merged_2022, price_2022, on=['region', 'time'], how='inner')

# 合并2021和2022年的数据作为训练集
merged_train = pd.concat([merged_2021, merged_2022])

# 读取测试集数据并合并
merged_test = pd.merge(gen_test, demand_test, on=['region', 'time'], how='inner')

# 去除同一地区同一时间的重复数据
merged_train = merged_train.drop_duplicates(subset=['region', 'time'])
merged_test = merged_test.drop_duplicates(subset=['region', 'time'])

# 划分数据集, 将2021和2022年数据用于训练，测试集使用2023年的数据
X_train = merged_train[['demand', 'capacity', 'type']]

# X_train = merged_train[['demand', 'capacity', 'type',
#                         'price_band_1', 'price_band_2', 'price_band_3', 'price_band_4', 'price_band_5',
#                         'price_band_6', 'price_band_7', 'price_band_8', 'price_band_9', 'price_band_10',
#                         'volume_band_1', 'volume_band_2', 'volume_band_3', 'volume_band_4', 'volume_band_5',
#                         'volume_band_6', 'volume_band_7', 'volume_band_8', 'volume_band_9', 'volume_band_10']]

y_train = merged_train['price'] if price_2021 is not None and price_2022 is not None else merged_train['fallback_price']

X_train_split, X_test_split, y_train_split, y_test_split = train_test_split(
    X_train, y_train, test_size=0.2, random_state=42
)

# 训练模型
logger.info("Initializing the MLP model...")
#--------------------------------------
# 创建存储最优结果的变量
best_mse = float('inf')  # 初始化最小MSE为一个极大值
best_params = None       # 存储最优参数

# 三层for循环，遍历hidden_layer_sizes的三组参数
# for i in range(50, 200, 20):
#     for j in range(50, 200, 20):
#         for k in range(50, 200, 20):
#             hidden_layer_sizes = (i, j, k)  # 组合成hidden_layer_sizes
#             # 初始化MLPRegressor模型
#             logger.info(f"Training MLP model with hidden_layer_sizes={hidden_layer_sizes}...")
#             model = MLPRegressor(activation="tanh", solver="adam", alpha=0.1, max_iter=1000,
#                                  hidden_layer_sizes=hidden_layer_sizes, random_state=10)
#             # 训练模型
#             model.fit(X_train_split, y_train_split)
#             # 预测测试集
#             y_pred_split = model.predict(X_test_split)
#             # 计算MSE
#             mse = mean_squared_error(y_test_split, y_pred_split)
#             logger.info(f"Hidden layers: {hidden_layer_sizes} | MSE: {mse}")
#
#             # 如果当前MSE小于最佳MSE，更新最优参数和最小MSE
#             if mse < best_mse:
#                 best_mse = mse
#                 best_params = hidden_layer_sizes
# logger.info(f"Best hidden_layer_sizes: {best_params} with MSE: {best_mse}")
#----------------------------------



#----------------------------------
model = MLPRegressor(activation="tanh", solver="adam", alpha=0.1, max_iter=1000, hidden_layer_sizes=(130, 130, 190),
                     random_state=10).fit(X_train_split, y_train_split)
y_pred_split = model.predict(X_test_split)

mse_split = mean_squared_error(y_test_split, y_pred_split)
r2_split = r2_score(y_test_split, y_pred_split)
logger.info(f"Mean Squared Error: {mse_split}")
logger.info(f"R-squared: {r2_split}")
#----------------------------------

# if mse_split < best_Mean_SquaredError:
#     best_Mean_SquaredError = mse_split
#     best_limit = limit
# logger.info(f"Best limit: {best_limit} with MSE: {best_Mean_SquaredError}")

# 预测测试集数据
X_test = merged_test[['demand', 'capacity', 'type']]

# X_test = merged_test[['demand', 'capacity', 'type',
#                       'price_band_1', 'price_band_2', 'price_band_3', 'price_band_4', 'price_band_5',
#                       'price_band_6', 'price_band_7', 'price_band_8', 'price_band_9', 'price_band_10',
#                       'volume_band_1', 'volume_band_2', 'volume_band_3', 'volume_band_4', 'volume_band_5',
#                       'volume_band_6', 'volume_band_7', 'volume_band_8', 'volume_band_9', 'volume_band_10']]

predictions = model.predict(X_test)


logger.info("Saving predictions to CSV...")
predictions_df = merged_test.copy()
predictions_df['predicted_price'] = predictions
pivot_data = predictions_df.pivot_table(
    values='predicted_price',
    index='time',
    columns='region',
    aggfunc='mean',
)
pivot_data.reset_index(inplace=True)
pivot_data['time_interval'] = pivot_data['time'].dt.strftime('%Y/%m/%d %H:%M')  # %d/%m/%Y %H:%M
pivot_data = pivot_data[['time_interval', 'NSW1', 'QLD1', 'SA1', 'TAS1', 'VIC1']]
pivot_data.to_csv('test_output.csv', index=False)

# 输出程序运行时间
end_time = time.time()
logger.info(f"Program completed in {end_time - start_time:.2f} seconds.")


# limit=1200
# INFO:__main__:Best hidden_layer_sizes: (195, 60, 115) with MSE: 731.1410078931026
# model = MLPRegressor(activation="tanh", solver="adam", alpha=0.1, max_iter=1000, hidden_layer_sizes=(195, 60, 115),
#                      random_state=10).fit(X_train_split, y_train_split)

#(50, 50, 150) | MSE: 623.9594186118152