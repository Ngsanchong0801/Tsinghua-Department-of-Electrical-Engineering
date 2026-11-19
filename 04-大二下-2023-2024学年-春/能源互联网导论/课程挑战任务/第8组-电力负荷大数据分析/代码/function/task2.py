import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from concurrent.futures import ProcessPoolExecutor

# 拆分数据
# data = pd.read_csv('D:/Googlefiles/GoogleDownload/LCL-FullData/LCL-FullData.csv')
# data['DateTime'] = pd.to_datetime(data['DateTime'])  # 将DateTime列转换为日期时间格式
# data_2013 = data[(data['DateTime'] >= '2013-01-01') & (data['DateTime'] < '2014-01-01')]
#
# ToU_data = data_2013[data_2013['stdorToU'] == 'ToU']
# idx = 1
# for key, group in ToU_data.groupby('LCLid'):
#     if len(group) >= 17500:  # 2013年有365天，每天48个半小时，共17520个数据点
#         output_data = group[['DateTime', 'KWH/hh (per half hour) ']]
#         output_data.to_csv(f'2013/home{idx}.csv', header=False, index=False)
#         idx += 1

# 读取电价数据
tariffs = pd.read_excel('tariffs.xlsx')
times_low = tariffs[tariffs['Tariff'] == 'Low']['TariffDateTime']
times_high = tariffs[tariffs['Tariff'] == 'High']['TariffDateTime']


# 计算电价变化带来的负荷变化
def calculate_impact(df0, times):
    df0['Time'] = pd.to_datetime(df0['Time'])
    time_to_idx = {time: idx0 for idx0, time in enumerate(df0['Time'])}
    d = []

    prev_day = None
    power = 0
    avg_power = 0
    count = 0
    for t in times:
        if t not in time_to_idx:
            continue

        t_day = df0.iloc[time_to_idx[t]]['Time'].date()
        if t_day != prev_day:
            if pd.notna(avg_power) and avg_power != 0 and count != 0:
                d.append(power - avg_power)
            power = 0
            avg_power = 0
            prev_day = t_day
        else:
            id0 = time_to_idx[t]
            if id0 + 48 < len(df0) and id0 >= 48:
                power += df0.iloc[id0]['Power']
                avg_power += (df0.iloc[id0 - 48]['Power'] + df0.iloc[id0 + 48]['Power']) / 2
                count += 1
    if not d:
        return np.nan
    mean_d = sum(d)/count
    return mean_d


# 集合成dataFrame
def process_file(id1):
    filename = f'2013/home{id1 + 1}.csv'
    df1 = pd.read_csv(filename, header=None)
    df1.columns = ['Time', 'Power']
    low = calculate_impact(df1, times_low)
    high = calculate_impact(df1, times_high)
    print(f'home{id1 + 1}')
    return [id1 + 1, low, high]


# 得到电价变化的日期和时刻数
def get_tariffs_times():
    # 获得变化第一天的时间点
    day1high = pd.Timestamp('2013-01-11 00:00:00')
    day1high = day1high.date()
    day1low = pd.Timestamp('2013-01-25 00:00:00')
    day1low = day1low.date()
    tshigh = [t for t in times_high if t.date() == day1high]
    tslow = [t for t in times_low if t.date() == day1low]
    tshigh = [(ts.hour * 2) + (ts.minute // 30) for ts in tshigh]
    tslow = [(ts.hour * 2) + (ts.minute // 30) for ts in tslow]
    return day1high, day1low, tshigh, tslow


# 得到完整长度的一天数据
def get_daily_power(df1, date):
    # 创建一个完整的时间索引
    full_time = pd.date_range(start=date, end=date + pd.Timedelta(hours=23, minutes=30), freq='30min')
    daily_data = df1[df1['Time'].dt.date == date].reset_index(drop=True)
    if daily_data.shape[0] < 48:
        daily_data_filled = pd.DataFrame(columns=['Time', 'Power'])
        daily_data_filled['Time'] = full_time
        for idx1 in daily_data_filled.index:
            if daily_data_filled.loc[idx1, 'Time'] not in daily_data['Time'] and idx1 != 0:
                daily_data_filled.loc[idx1, 'Power'] = (daily_data.loc[idx1 - 1, 'Power'] +
                                                        daily_data.loc[idx1, 'Power'])
            else:
                daily_data_filled.loc[idx1, 'Power'] = daily_data.loc[idx1, 'Power']
        return daily_data_filled
    return daily_data


# 数据集合
def plot_files(args):
    idx2, tday1, tday2, Q_homes1, Q_homes3, Q_homes4 = args

    filename = f'2013/home{idx2 + 1}.csv'
    df2 = pd.read_csv(filename, header=None)
    df2.columns = ['Time', 'Power']
    df2['Time'] = pd.to_datetime(df2['Time'])

    df_day1 = get_daily_power(df2, tday1)
    df_day1_1 = get_daily_power(df2, tday1 - pd.Timedelta(days=1))
    df_day1_2 = get_daily_power(df2, tday1 + pd.Timedelta(days=1))

    df_day2 = get_daily_power(df2, tday2)
    df_day2_1 = get_daily_power(df2, tday2 - pd.Timedelta(days=1))
    df_day2_2 = get_daily_power(df2, tday2 + pd.Timedelta(days=1))

    power_high_1 = (df_day1_1['Power'].values + df_day1_2['Power'].values) / 2
    power_low_1 = (df_day2_1['Power'].values + df_day2_2['Power'].values) / 2
    if (idx2 + 1) in Q_homes3 + Q_homes4:
        power_high_2 = df_day1['Power'].values
    else:
        power_high_2 = power_high_1
    if (idx2 + 1) in Q_homes1 + Q_homes4:
        power_low_2 = df_day2['Power'].values
    else:
        power_low_2 = power_low_1
    print('home' + str(idx2 + 1))
    return power_high_1, power_high_2, power_low_1, power_low_2


# 聚类并绘图
def quadrants():
    df1 = pd.read_csv('d.csv')
    colors = {
        'Q1': 'red',
        'Q2': 'blue',
        'Q3': 'green',
        'Q4': 'purple'
    }
    quadrant_counts = {
        'Q1': {'count': 0, 'homes': []},
        'Q2': {'count': 0, 'homes': []},
        'Q3': {'count': 0, 'homes': []},
        'Q4': {'count': 0, 'homes': []},
    }
    df1['Quadrant'] = ''
    # 分象限统计
    for i, row in df1.iterrows():
        if row['Low Avg'] > 0 and row['High Avg'] > 0:
            quadrant_counts['Q1']['count'] += 1
            quadrant_counts['Q1']['homes'].append(row['Home'])
            df1.at[i, 'Quadrant'] = 'Q1'
        if row['Low Avg'] > 0 > row['High Avg']:
            quadrant_counts['Q4']['count'] += 1
            quadrant_counts['Q4']['homes'].append(row['Home'])
            df1.at[i, 'Quadrant'] = 'Q4'
        if row['Low Avg'] < 0 < row['High Avg']:
            quadrant_counts['Q2']['count'] += 1
            quadrant_counts['Q2']['homes'].append(row['Home'])
            df1.at[i, 'Quadrant'] = 'Q2'
        if row['Low Avg'] < 0 and row['High Avg'] < 0:
            quadrant_counts['Q3']['count'] += 1
            quadrant_counts['Q3']['homes'].append(row['Home'])
            df1.at[i, 'Quadrant'] = 'Q3'
    for quadrant, data in quadrant_counts.items():
        percentage = data['count'] * 100 / 978
        print(f"{quadrant}: {data['count']} ({percentage:.2f}%)")

    plt.figure(1, figsize=(12, 6))
    for quadrant, color in colors.items():
        subset = df1[df1['Quadrant'] == quadrant]
        plt.scatter(subset['Low Avg'], subset['High Avg'], label=quadrant, color=color)

    plt.xlabel('Low Avg/(kw/h)', fontsize=15)
    plt.ylabel('High Avg/(kw/h)', fontsize=15)
    plt.axhline(0, color='black', linewidth=2)
    plt.axvline(0, color='black', linewidth=2)
    plt.text(0.5, 0.82, f"{quadrant_counts['Q1']['count']} ({quadrant_counts['Q1']['count'] * 100 / 978:.2f}%)",
             transform=plt.gca().transAxes, fontsize=15, fontweight='bold', color=colors['Q1'])
    plt.text(0.05, 0.82, f"{quadrant_counts['Q2']['count']} ({quadrant_counts['Q2']['count'] * 100 / 978:.2f}%)",
             transform=plt.gca().transAxes, fontsize=15, fontweight='bold', color=colors['Q2'])
    plt.text(0.05, 0.28, f"{quadrant_counts['Q3']['count']} ({quadrant_counts['Q3']['count'] * 100 / 978:.2f}%)",
             transform=plt.gca().transAxes, fontsize=15, fontweight='bold', color=colors['Q3'])
    plt.text(0.5, 0.28, f"{quadrant_counts['Q4']['count']} ({quadrant_counts['Q4']['count'] * 100 / 978:.2f}%)",
             transform=plt.gca().transAxes, fontsize=15, fontweight='bold', color=colors['Q4'])

    plt.legend()
    plt.savefig('电价聚类.png')
    plt.show()

    return quadrant_counts


def plot_tariff_impact(results_t0, ts_high0, ts_low0):
    power_high_sum1 = sum([result[0] for result in results_t0])
    power_high_sum2 = sum([result[1] for result in results_t0])
    power_low_sum1 = sum([result[2] for result in results_t0])
    power_low_sum2 = sum([result[3] for result in results_t0])

    plt.figure(1, figsize=(12, 6))
    plt.plot(power_high_sum1, color='black', label='Normal tariff')
    plt.plot(power_high_sum2, color='grey')
    plt.plot(ts_high0, power_high_sum2[ts_high0], color='red', label='High tariff')

    plt.xlabel('Time')
    plt.ylabel('Power')
    plt.legend()
    plt.savefig('对比high.png')
    plt.show()

    plt.figure(2, figsize=(12, 6))
    plt.plot(power_low_sum1, color='black', label='Normal tariff')
    plt.plot(power_low_sum2, color='grey')
    plt.plot(ts_low0, power_low_sum2[ts_low0], color='red', label='Low tariff')

    plt.xlabel('Time')
    plt.ylabel('Power')
    plt.legend()
    plt.savefig('对比low.png')
    plt.show()


if __name__ == '__main__':
    # with ProcessPoolExecutor() as executor:
    #     results = list(executor.map(process_file, range(978)))
    # results_df = pd.DataFrame(results, columns=['Home', 'Low Avg', 'High Avg'])
    # results_df.to_csv('d.csv', index=False)
    quadrants1 = quadrants()

    day1_high, day1_low, ts_high, ts_low = get_tariffs_times()
    args_t = [(idx, day1_high, day1_low, quadrants1['Q1']['homes'],
               quadrants1['Q3']['homes'], quadrants1['Q4']['homes']) for idx in range(978)]
    with ProcessPoolExecutor() as executor:
        results_t = list(executor.map(plot_files, args_t))
    plot_tariff_impact(results_t, ts_high, ts_low)
