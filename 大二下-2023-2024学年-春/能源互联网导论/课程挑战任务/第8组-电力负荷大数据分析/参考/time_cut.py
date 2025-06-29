import numpy as np
import pandas as pd
from datetime import datetime, timedelta
from sklearn_extra.cluster import KMedoids
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans
import tslearn.metrics as metrics
from tslearn.preprocessing import TimeSeriesScalerMeanVariance, \
    TimeSeriesResampler   #预处理方法1
import lttb  #预处理方法2

from tslearn.clustering import silhouette_score
from tslearn.preprocessing import TimeSeriesScalerMeanVariance
from tslearn.generators import random_walks
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt

data = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2016.csv")
data = data.iloc[:, 0:2]
data['Date & Time'] = pd.to_datetime(data['Date & Time'])
data['Date & Time'] = data['Date & Time'].dt.strftime('%Y%m%d')
data1 = data.set_index("Date & Time")
#设置初始日期和终止日期
start_date_str = "20160101"
end_date_str = "20161231"
start_date = datetime.strptime(start_date_str, "%Y%m%d")
end_date = datetime.strptime(end_date_str, "%Y%m%d")
current_date = start_date
i = 0
while current_date <= end_date:
    current_date_str = current_date.strftime("%Y%m%d")
    data_cut = data1.loc[current_date_str]
    data_cut = np.array(data_cut).T
    if (i == 0):

        X_out = data_cut
    else:
        X_out = np.concatenate((X_out, data_cut), axis=0)
    # print(data_cut)
    current_date += timedelta(days=1)
    i += 1
print(X_out)
print(X_out.shape)


# y = 2016
# for m in range(1,13):
#     for d in range(1,29):
#         if (d>=1 )
#         data_cut = data1.loc[str(y) + str(0) + str(m) + str(d)]
#

# print(data)



# data["trade_date"] = pd.to_datetime(data.Date & Time)
# data1 = data.set_index("Date & Time")
# print(data1.loc["2016/1/1"].head())
