import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import lttb
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans
from sklearn_extra.cluster import KMedoids
import tslearn.metrics as metrics
from tslearn.clustering import silhouette_score
from sklearn.mixture import GaussianMixture
from PyEMD import CEEMDAN

plt.rcParams['font.sans-serif'] = ['STsong']


class Cluster:
    def __init__(self, data=None, option=1):
        if data is None:
            data = pd.read_csv('2016/Apt1_2016.csv', header=None)
        if option == 1:
            self.data = data
            self.oneday_data = data.iloc[0:1440, 1]  # 第一天的数据
            self.weekly_data = self.week_cut()  # 数据格式处理
            self.denoise()  # 降噪
            self.daily_data = self.day_cut()
            # self.processed_data = self.scale(self.downsample(self.daily_data))  # 降采样 + 归一化
            self.processed_data = self.downsample(self.daily_data)
        if option == 2:
            self.daily_data = data
            self.processed_data = self.scale(self.daily_data)

    def week_cut(self):
        df = self.data.copy()
        df.columns = ['Time', 'Power']
        df['Time'] = pd.to_datetime(df['Time'])
        df['Date'] = df['Time'].dt.strftime('%Y%m%d')
        df['Minute'] = df['Time'].dt.strftime('%H:%M')
        df['Month&weekday'] = df['Time'].dt.strftime('%m') + '_' + (df['Time'].dt.weekday + 1).astype(str)

        weekly_data = df.pivot_table(index='Minute', columns='Month&weekday', values='Power', aggfunc='mean')
        # january_mondays = df[(df['Month&weekday'] == '01_1') & (df['Minute'] == '00:00')]
        # print(january_mondays[['Time', 'Power']].mean())
        self.data = df
        return weekly_data

    def day_cut(self, start_date=None, end_date=None):
        df = self.data.copy()
        daily_data = df.pivot_table(index='Minute', columns='Date', values='Power')
        if start_date is not None:
            daily_data = daily_data.loc[:, start_date:end_date]
        return daily_data

    def denoise(self):
        df = self.data.copy()
        for idx in df.index:
            if df.loc[idx, 'Power'] < 0.4:  # 较低值
                row = df.loc[idx, 'Minute']
                col = df.loc[idx, 'Month&weekday']
                df.loc[idx, 'Power'] = self.weekly_data.loc[row, col]
        for idx in df.index[10:-10]:  # 变化过快值
            if abs(df.loc[idx, 'Power'] - df.loc[idx - 1, 'Power']) / df.loc[idx - 1, 'Power'] > 0.5:
                df.loc[idx, 'Power'] = df.loc[idx - 10:idx + 10, 'Power'].mean()

        MA = df['Power'].rolling(window=5).mean()  # 动平均
        MA_fill = MA.fillna(df['Power'])
        df['Power'] = MA_fill

        self.data = df

    def find_typical_day(self):
        df = self.processed_data.copy()
        dists = metrics.cdist_dtw(df.T)
        typical_day = np.argmin(np.sum(dists, axis=1))
        return df.iloc[:, typical_day]

    def plot_typical_day(self):
        df = self.processed_data.copy()
        dists = metrics.cdist_dtw(df.T)

        typical_day = np.argmin(np.sum(dists, axis=1))
        closest_days = np.argsort(dists[typical_day])[:5]

        plt.figure(figsize=(10, 5))
        for day in df.columns:
            plt.plot(df[day], color='grey', alpha=.5)
        for idx in closest_days:
            plt.plot(df.iloc[:, idx], color='blue', alpha=.3)

        plt.plot(df.iloc[:, typical_day], label='closest_days', color='blue')
        plt.plot(df.iloc[:, typical_day], label='Cluster Center', color='red')

        plt.legend()
        # plt.savefig('典型日.png')
        plt.show()

    def plot_denoise(self):
        day1 = self.data.iloc[0:1440, :]
        day1.loc[:, 'Power'] = self.oneday_data

        plt.rcParams['font.sans-serif'] = ['STsong']
        plt.figure(figsize=(10, 6))
        plt.subplot(2, 2, 1)
        plt.plot(day1['Power'])
        plt.title('原始数据')

        for idx in day1.index:
            if day1.loc[idx, 'Power'] < 0.4:
                row = day1.loc[idx, 'Minute']
                col = day1.loc[idx, 'Month&weekday']
                day1.loc[idx, 'Power'] = self.weekly_data.loc[row, col]
        plt.subplot(2, 2, 2)
        plt.plot(day1['Power'])
        plt.title('处理1')

        for idx in day1.index[10:-10]:
            if abs(day1.loc[idx, 'Power'] - day1.loc[idx - 1, 'Power']) / day1.loc[idx - 1, 'Power'] > 0.5:
                day1.loc[idx, 'Power'] = day1.loc[idx - 10:idx + 10, 'Power'].mean()
        plt.subplot(2, 2, 3)
        plt.plot(day1['Power'])
        plt.title('处理2')

        MA = day1['Power'].rolling(window=4).mean()
        MA_fill = MA.fillna(day1['Power'])
        day1.loc[:, 'Power'] = MA_fill
        plt.subplot(2, 2, 4)
        plt.plot(day1['Power'])
        plt.title('处理3')

        plt.savefig('降噪.png')
        plt.show()

    def plot_downsample(self):
        data_1day = self.daily_data.iloc[:, 0]
        data_1day_downsampled = self.downsample(data_1day)

        plt.figure(figsize=(10, 6))
        plt.subplot(1, 2, 1)
        plt.plot(data_1day.values)
        plt.title('处理前')
        plt.ylabel('功率/kW')
        plt.subplot(1, 2, 2)
        plt.plot(data_1day_downsampled)
        plt.title('处理后')
        plt.ylabel('功率/kW')
        plt.savefig('降采样.png')
        plt.show()

    def plot_elbow(self, df=None, ran=None, option=1):
        if df is None:
            df = self.processed_data
        df_T = df.T
        distances = metrics.cdist_dtw(df_T)  # DTW
        SSE = pd.DataFrame()
        SC = pd.DataFrame()

        for i in ran:
            cluster1 = KMeans(n_clusters=i)  # kmeans++|欧几里得距离
            cluster2 = KMedoids(n_clusters=i)  # kmedoids
            cluster3 = KMedoids(n_clusters=i, metric="precomputed")  # kmedoids|DTW
            # cluster4 = GaussianMixture(n_components=i)

            cluster1.fit(df_T)
            cluster2.fit(df_T)
            cluster3.fit(distances)
            sse = pd.DataFrame([[cluster1.inertia_, cluster2.inertia_, cluster3.inertia_]])
            SSE = pd.concat([SSE, sse])

            y_pred1 = cluster1.fit_predict(df_T)
            y_pred2 = cluster2.fit_predict(df_T)
            y_pred3 = cluster3.fit_predict(distances)
            sc = pd.DataFrame([[silhouette_score(df_T, y_pred1, metric="euclidean"),
                                silhouette_score(df_T, y_pred2, metric="euclidean"),
                                silhouette_score(distances, y_pred3, metric="precomputed")]])
            SC = pd.concat([SC, sc])

        SSE.columns = ['kmeans++', 'kmedoids', 'kmedoids+DTW']
        SC.columns = ['kmeans++', 'kmedoids', 'kmedoids+DTW']
        marker_styles = ['o', '^', 's']

        plt.figure(1, figsize=(10, 6))
        for i, col in enumerate(SSE.columns):
            plt.plot(ran, SSE[col], marker=marker_styles[i], label=col)

        plt.legend()
        plt.xticks(ran)
        plt.xlabel('聚类数目k')
        plt.ylabel('SSE')
        plt.savefig('肘部曲线' + str(option) + '.png')
        plt.show()

        plt.figure(2, figsize=(10, 6))
        for i, col in enumerate(SC.columns):
            plt.plot(ran, SC[col], marker=marker_styles[i], label=col)

        plt.legend()
        plt.xticks(ran)
        plt.xlabel('聚类数目k')
        plt.ylabel('SC')
        plt.yticks([])
        plt.savefig('轮廓系数' + str(option) + '.png')
        plt.show()

    @staticmethod
    def kmedoids_DTW(df, n, option):
        km = KMedoids(n_clusters=n, metric="precomputed")
        dists = metrics.cdist_dtw(df.T)
        y_pred = km.fit_predict(dists)
        np.fill_diagonal(dists, 0)
        score = silhouette_score(dists, y_pred, metric="precomputed")  # 计算所有样本轮廓数均值
        # print(df.T.shape)
        # print(y_pred.shape)
        # print(y_pred)
        # print("silhouette_score: " + str(score))
        label = km.labels_
        nums = []
        plt.figure(1, figsize=(10, 6))
        for i in range(n):
            if option == 1:
                plt.subplot(1, 2, i + 1)
            else:
                plt.subplot(2, int(np.ceil(n / 2)), i + 1)
            for x in df.loc[:, y_pred == i]:
                plt.plot(df[x], color='grey', alpha=.3)
            center_indice = km.medoid_indices_[i]
            plt.plot(df.iloc[:, center_indice], "r-")  # 画中心线
            plt.plot(df.loc[:, y_pred == i].mean(axis=1, skipna=True))
            plt.text(0.55, 0.85, 'Cluster %d' % (i + 1),
                     transform=plt.gca().transAxes)
            if i == 1:
                plt.title("kmedoids_DTW")
            nums.append((y_pred == i).sum())

        plt.tight_layout()
        plt.savefig('kmedoids_DTW' + str(option) + '.png')
        plt.show()

        if option == 2:
            plt.figure(2, figsize=(10, 6))
            total = sum(nums)
            percentages = [num / total * 100 for num in nums]
            labels = [str(i) for i in range(1, 6)]
            colors = ['gold', 'yellowgreen', 'lightcoral', 'lightskyblue', 'orange']
            font_dict = {'fontsize': 16, 'fontweight': 'bold'}
            plt.pie(percentages, labels=labels, colors=colors,
                    autopct='%1.1f%%', startangle=140, textprops=font_dict)

            plt.axis('equal')
            plt.legend(labels, fontsize='small')
            plt.savefig('扇形图.png')
            plt.show()
        return label

    @staticmethod
    def downsample(df, n_out=96):  # 降采样
        if isinstance(df, pd.Series):
            df = df.to_frame()
        df_out = {}
        for column in df.columns:
            df_col = df[column].dropna()
            df_col_2d = np.column_stack((np.arange(len(df_col)), df_col))
            df_col_downsampled_2d = lttb.downsample(df_col_2d, n_out=n_out)
            df_col_downsampled = df_col_downsampled_2d[:, 1]
            df_out[column] = df_col_downsampled
        df_out = pd.DataFrame(df_out)
        return df_out

    @staticmethod
    def scale(df):  # 归一化
        scaler = MinMaxScaler()
        df_scaled = scaler.fit_transform(df)
        df_scaled = pd.DataFrame(df_scaled, columns=df.columns)
        return df_scaled

    @staticmethod
    def denoise1(df):
        df_out = {}
        for column in df.columns:
            ceemdan = CEEMDAN(trials=100, noise_width=0.2)
            imfs = ceemdan(df[column].values)
            imfs_num = np.sum(imfs[1:, :], axis=0)
            df_out[column] = imfs_num
        df_out = pd.DataFrame(df_out)
        return df_out
