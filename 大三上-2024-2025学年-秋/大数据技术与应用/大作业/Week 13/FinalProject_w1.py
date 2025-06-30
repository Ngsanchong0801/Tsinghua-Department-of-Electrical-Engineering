from sklearn.neural_network import MLPRegressor
import sqlite3
import pandas as pd
import time
import logging
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score

# 设置日志记录器
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
# 记录程序开始的时间
start_time = time.time()

# 连接到数据库并读取数据
def load_data(database, limit=None, condition=None):
    logger.info(f"Loading data from {database}...")  # 日志记录
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


# 读取2021和2022年的数据，限制加载的行数
gen_2021, demand_2021, price_2021 = load_data('data_2021.db', limit=1200)  # 加载前xxxx行
gen_2022, demand_2022, price_2022 = load_data('data_2022.db', limit=1200)  # 加载前xxxx行

# 读取测试集数据
gen_test, demand_test, _ = load_data('test_input_w1.db')

# 处理时间列
logger.info("Processing time columns...")
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
logger.info("Filling missing values...")
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
logger.info("Merging datasets...")
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
logger.info("Removing duplicate entries based on region and time...")
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
model = MLPRegressor(activation="relu", solver="adam", alpha=0.1, max_iter=1000, hidden_layer_sizes=(190, 150, 50),
                     random_state=10).fit(X_train_split, y_train_split)
y_pred_split = model.predict(X_test_split)

# 预测测试集数据
X_test = merged_test[['demand', 'capacity', 'type']]

# X_test = merged_test[['demand', 'capacity', 'type',
#                       'price_band_1', 'price_band_2', 'price_band_3', 'price_band_4', 'price_band_5',
#                       'price_band_6', 'price_band_7', 'price_band_8', 'price_band_9', 'price_band_10',
#                       'volume_band_1', 'volume_band_2', 'volume_band_3', 'volume_band_4', 'volume_band_5',
#                       'volume_band_6', 'volume_band_7', 'volume_band_8', 'volume_band_9', 'volume_band_10']]

predictions = model.predict(X_test)

# 保存结果到 CSV
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

# 誤差
mse_split = mean_squared_error(y_test_split, y_pred_split)
r2_split = r2_score(y_test_split, y_pred_split)
logger.info(f"Mean Squared Error: {mse_split}")
logger.info(f"R-squared: {r2_split}")

# INFO:__main__:Mean Squared Error: 4751.132261817674
# INFO:__main__:R-squared: -0.0035059424878245427
