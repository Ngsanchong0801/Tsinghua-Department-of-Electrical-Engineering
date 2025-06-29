import kmeans_learn
import numpy as np
import pandas as pd
from sklearn_extra.cluster import KMedoids
from sklearn.preprocessing import MinMaxScaler
from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta
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

#对一整年的总功率进行按日期切片
def time_cut_day():
    data = pd.read_csv("D:\projectPython\project_energy\HomeG-electrical\HomeG\HomeG-meter1_2016.csv")
    #这里是先对文件进行切片，这里选择保留总功率和时间，并把时间设置为索引
    data = data.iloc[:, 0:2]
    data['Date & Time'] = pd.to_datetime(data['Date & Time'])
    data['Date & Time'] = data['Date & Time'].dt.strftime('%Y%m%d')
    data1 = data.set_index("Date & Time")
    # 设置初始日期和终止日期
    start_date_str = "20160101"
    end_date_str = "20161215"
    start_date = datetime.strptime(start_date_str, "%Y%m%d")
    end_date = datetime.strptime(end_date_str, "%Y%m%d")
    current_date = start_date
    i = 0
    while current_date <= end_date:
        current_date_str = current_date.strftime("%Y%m%d")
        data_cut = data1.loc[current_date_str]
        data_cut = np.array(data_cut).T
        if (i == 0):
            data_cut = downsample(data_cut, 45)
            X_out = data_cut
        else:
            data_cut = downsample(data_cut, 45)
            X_out = np.concatenate((X_out, data_cut), axis=0)
        # print(data_cut)
        current_date += timedelta(days=1)
        i += 1
    return X_out

#对一整年的总功率进行按日期切片
def time_cut_AC_day():
    data = pd.read_csv("D:\projectPython\project_energy\HomeF-electrical\HomeF\HomeF-meter2_2016.csv")
    #这里是先对文件进行切片，这里选择保留总功率和时间，并把时间设置为索引
    data = data.loc[:, ["Date & Time", "Microwave [kW]"]]
    data['Date & Time'] = pd.to_datetime(data['Date & Time'])
    data['Date & Time'] = data['Date & Time'].dt.strftime('%Y%m%d')
    data1 = data.set_index("Date & Time")
    # 设置初始日期和终止日期
    start_date_str = "20160121"
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
            data_cut = downsample(data_cut, 45)
            X_out = data_cut
        else:
            data_cut = downsample(data_cut, 45)
            X_out = np.concatenate((X_out, data_cut), axis=0)
        # print(data_cut)
        current_date += timedelta(days=1)
        i += 1
    return X_out

#对一整年的数据进行按月份切片
def time_cut_month():
    data = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2016.csv")
    #这里是先对文件进行切片，这里选择保留总功率和时间，并把时间设置为索引
    data = data.iloc[:, 0:2]
    data['Date & Time'] = pd.to_datetime(data['Date & Time'])
    data['Date & Time'] = data['Date & Time'].dt.strftime('%Y%m')
    data1 = data.set_index("Date & Time")
    # 设置初始月份和终止月份
    start_date_str = "201601"
    end_date_str = "201612"
    start_date = datetime.strptime(start_date_str, "%Y%m")
    end_date = datetime.strptime(end_date_str, "%Y%m")
    current_date = start_date
    i = 0
    while current_date <= end_date:
        current_date_str = current_date.strftime("%Y%m")
        data_cut = data1.loc[current_date_str]
        data_cut = np.array(data_cut).T
        if (i == 0):
            data_cut = downsample(data_cut, 1000)
            X_out = data_cut
        else:
            data_cut = downsample(data_cut, 1000)
            X_out = np.concatenate((X_out, data_cut), axis=0)
        # print(data_cut)
        current_date += relativedelta(months=1)
        i += 1
    return X_out

def downsample(X_init, n):
    X_out = np.zeros((X_init.shape[0],n))
    for i in range(X_init.shape[0]):
        # data_copy = np.zeros((X_init.shape[1],2))
        # data_small = np.zeros((n,2))
        data_copy = np.array([np.arange(X_init.shape[1]), X_init[i,:]]).T
        data_small = lttb.downsample(data_copy, n_out=n)
        X_out[i, :] = data_small.T[1,:]
    return X_out

def downsample_single(X_init, n):
    X_out = np.zeros((1,n))
    data_copy = np.array([np.arange(X_init.shape[0]), X_init]).T
    data_small = lttb.downsample(data_copy, n_out=n)
    X_out[0, :] = data_small.T[1,:]
    return X_out

def draw_downsample(X_init, X_out, i):
    # 绘制第一个时间序列的坐标图
    plt.figure(1)
    plt.plot(np.arange(X_init.shape[1]), X_init[i, : ])
    plt.xlabel('Time')
    plt.ylabel('X_init')
    plt.title('Time Series {} X_init'.format(i))
    plt.savefig('figs/Time Series {} X_init.png'.format(i))

    # 绘制第二个时间序列的坐标图
    plt.figure(2)
    plt.plot(np.arange(X_out.shape[1]), X_out[i, : ])
    plt.xlabel('Time')
    plt.ylabel('X_out')
    plt.title('Time Series {} X_out'.format(i))
    plt.savefig('figs/Time Series {} X_out.png'.format(i))

    # 显示图形
    plt.show()

# elbow法则找最佳聚类数，结果：elbow =
def test_elbow(X, seed):
    distortions = []
    dists = metrics.cdist_dtw(X)  # dba + dtw
    # dists = metrics.cdist_soft_dtw_normalized(X,gamma=.5) # softdtw
    #此处设计为聚类的数目
    for i in range(2, 10):
        km = KMedoids(n_clusters=i, random_state=seed, metric="precomputed")
        km.fit(dists)
        # 记录误差和
        distortions.append(km.inertia_)
    #此处也需要修改
    plt.plot(range(2, 10), distortions, marker='o')
    plt.xlabel('Number of clusters')
    plt.ylabel('Distortion')
    plt.show()
    plt.savefig('figs/Time Series X.png')

#归一化处理模块
def one(train_set):
    scaler = MinMaxScaler(feature_range=(0, 1))
    train_norm = scaler.fit_transform(train_set.T)
    return train_norm.T

def test_kmedoids(X, n):
    num_cluster = n
    # 声明precomputed自定义相似度计算方法
    km = KMedoids(n_clusters=num_cluster, random_state=0, metric="precomputed")
    # 采用tslearn中的DTW系列及变种算法计算相似度，生成距离矩阵dists
    dists = metrics.cdist_dtw(X)  # dba + dtw
    # dists = metrics.cdist_soft_dtw_normalized(X,gamma=0.5) # softdtw
    y_pred = km.fit_predict(dists)
    np.fill_diagonal(dists, 0)
    score = silhouette_score(dists, y_pred, metric="precomputed") #计算所有样本轮廓数均值
    print(X.shape)
    print(y_pred.shape)
    print("silhouette_score: " + str(score))
    label = km.labels_
    print(label)
    for yi in range(num_cluster):
        plt.subplot(5, 5, yi + 1)
        for xx in X[y_pred == yi]:
            plt.plot(xx.ravel(), "k-", alpha=.3)
        # 注意这里的_cluster_centers要写成X[km.medoid_indices_[yi]]，因为你是precomputed，源码里面当precomputed时_cluster_centers等于None
        plt.plot(X[km.medoid_indices_[yi]], "r-") #画中心线
        plt.text(0.55, 0.85, 'Cluster %d' % (yi + 1),
                 transform=plt.gca().transAxes)
        if yi == 1:
            plt.title("KMedoids" + " + DBA-DTW")
    plt.tight_layout()
    plt.show()
    plt.savefig('figs/KMedoids_DBA-DTW.png')
    plt.tight_layout()
    plt.show()
    plt.savefig('figs/KMeans_DBA-DTW.png')
    return label

#计算整体
def year_power():
    data_list = {}
    data_cut = {}
    X_cut = {}
    X_out = {}
    # 数据读取
    data_list[0] = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2014.csv")
    data_list[1] = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2015.csv")
    data_list[2] = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2016.csv")
    data_list[3] = pd.read_csv("D:\projectPython\project_energy\HomeC-electrical\HomeC\HomeC-meter1_2014.csv")
    data_list[4] = pd.read_csv("D:\projectPython\project_energy\HomeC-electrical\HomeC\HomeC-meter1_2015.csv")
    data_list[5] = pd.read_csv("D:\projectPython\project_energy\HomeC-electrical\HomeC\HomeC-meter1_2016.csv")
    data_list[6] = pd.read_csv("D:\projectPython\project_energy\HomeD-electrical\HomeD\HomeD-meter1_2016.csv")
    data_list[7] = pd.read_csv("D:\projectPython\project_energy\HomeF-electrical\HomeF\HomeF-meter2_2014.csv")
    data_list[8] = pd.read_csv("D:\projectPython\project_energy\HomeF-electrical\HomeF\HomeF-meter2_2015.csv")
    data_list[9] = pd.read_csv("D:\projectPython\project_energy\HomeF-electrical\HomeF\HomeF-meter2_2016.csv")
    data_list[10] = pd.read_csv("D:\projectPython\project_energy\HomeG-electrical\HomeG\HomeG-meter1_2016.csv")
    data_list[11] = pd.read_csv("D:\projectPython\project_energy\HomeH-electrical\HomeH\HomeH-meter2_2016.csv")

    for i in range(12):
        data_cut[i] = data_list[i].iloc[:, 1]
        X_cut[i] = np.array(data_cut[i]).T
        X_out[i] = downsample_single(X_cut[i], 2000)

    X_train = X_out[0]
    for i in range(1, 12):
        X_train = np.concatenate((X_train, X_out[i]), axis=0)

    return X_train

#计算各个占比的模块
def calculate_percentage(array):
    counts = {}
    percentages = {}
    for number in array:
        if number in counts:
            counts[number] += 1
        else:
            counts[number] = 1
    total = len(array)
    for number, count in counts.items():
        percentage = count / total * 100
        percentages[number] = percentage
    return percentages

#绘制扇形图
def plot_pie_chart(percentages):
    labels = []
    sizes = []
    colors = []
    explode = []

    for number, percentage in percentages.items():
        labels.append(str(number))
        sizes.append(percentage)
        colors.append('lightskyblue')
        explode.append(0)

    plt.pie(sizes, explode=explode, labels=labels, colors=colors, autopct='%1.1f%%',
            shadow=True, startangle=90)
    plt.axis('equal')  # 使饼图为正圆形
    plt.title('Percentage of Numbers')
    plt.show()

#对同一户家庭某一年不同的家用电器进行分析
def home_all():
    data1 = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter1_2015.csv")
    data2 = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeB-meter2_2015.csv")
    # data3 = pd.read_csv("D:\projectPython\project_energy\HomeB-electrical\HomeB\HomeA-meter4_2015.csv")
    data1_cut = data1.iloc[:, 3:]
    data2_cut = data2.iloc[:, 3:]
    # data3_cut = data3.iloc[:, 3:]
    X1 = np.array(data1_cut).T
    # print(X1)
    X1 = downsample(X1, 5000)
    X2 = np.array(data2_cut).T
    X2 = downsample(X2, 5000)
    # X3 = np.array(data3_cut).T
    # X3 = downsample(X3, 5000)
    X_train = np.concatenate((X1, X2), axis=0)
    # print(X_train)
    # print(X_train.shape)
    return X_train


# X_train = TimeSeriesResampler(sz=100).fit_transform(X)
# X = X_train

X = time_cut_AC_day()
# X = time_cut_day()
# X_one = one(X_train)
# X_one = one(X)
X_one = X
# X = downsample(X_train, 5000)
# draw_downsample(X_train, X, 3)
# draw_downsample(X_train, X, 7)
label = kmeans_learn.DBA_k_means(5, 0, X_one)
# # label = test_kmedoids(X_one, 8)
percentages = calculate_percentage(label)
plot_pie_chart(percentages)

# test_elbow(X_one, 0)
# test_kmedoids(X_one, 10)
# print(X)
# print(X.shape)
# # print(X_train)
# # print(X_train.shape)
# print(X_one)
# print(X_one.shape)

