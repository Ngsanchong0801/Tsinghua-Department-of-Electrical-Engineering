import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from sklearn.manifold import LocallyLinearEmbedding
from sklearn.decomposition import PCA
from datetime import datetime, timedelta
import lttb
from function import Cluster
import tslearn.metrics as metrics
from sklearn.cluster import KMeans
from sklearn_extra.cluster import KMedoids
from PyEMD import CEEMDAN
from concurrent.futures import ProcessPoolExecutor
import time


def process_file(idx):
    filename = f'2016/Apt{idx + 1}_2016.csv'
    data = pd.read_csv(filename, header=None)
    Cluster_f = Cluster(data, option=1)
    print(f'Apt{idx + 1}')
    return 'Apt' + str(idx + 1), Cluster_f.find_typical_day().tolist()


# 数据处理
if __name__ == '__main__':
    # data = pd.read_csv('2016/Apt1_2016.csv', header=None)
    # Cluster1 = Cluster(data, option=1)
    # Cluster1.plot_denoise()
    # Cluster1.plot_downsample()
    # Cluster1.plot_elbow(ran=range(2, 5), option=1)
    # Cluster1.kmedoids_DTW(Cluster1.processed_data, n=2, option=1)
    # Cluster1.plot_typical_day()

    # 获得各公寓典型日
    # t1 = time.time()
    with ProcessPoolExecutor() as executor:
        results = dict(executor.map(process_file, range(114)))
    apartmentsData = pd.DataFrame(results)
    apartmentsData.to_csv('typicaldays.csv', index=False)
    # t2 = time.time()
    # print(f"多线程: {(t2 - t1)/60} min")

    # with ProcessPoolExecutor() as executor:
    #     results = list(executor.map(process_file, range(978)))
    # results_df = pd.DataFrame(results, columns=['Home', 'Low Avg', 'High Avg'])
    # results_df.to_csv('d.csv', index=False)
    # quadrants1 = quadrants()

    # 聚类
    # df = pd.read_csv('typicaldays.csv')
    # Cluster2 = Cluster(df, option=2)
    # Cluster2.plot_elbow(df=Cluster2.processed_data, ran=range(2, 11), option=2)
    # Cluster2.kmedoids_DTW(df=Cluster2.processed_data, n=5, option=2)

    # 天气
    # data = pd.read_csv('2016/Apt1_2016.csv', header=None)
    # Cluster3 = Cluster(data, option=3)
    # temperature = pd.read_excel('apartment2016.xlsx')['temperature']
    #
    # plt.figure(figsize=(12, 5))
    # Min = min(len(temperature), len(Cluster3.processed_data))
    # plt.scatter(temperature[0:Min], Cluster3.processed_data[0:Min])
    # plt.show()
