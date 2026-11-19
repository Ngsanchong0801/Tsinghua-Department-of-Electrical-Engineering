import numpy as np
from datetime import datetime, timedelta


def reshape_data(data, flag):
    basedates = [
        datetime(2005, 1, 1, 1, 00),
        datetime(2009, 1, 9, 8, 00),
        datetime(2010, 10, 1, 1, 00),
        datetime(2010, 11, 1, 1, 00),
        datetime(2010, 12, 1, 1, 00),
        datetime(2011, 1, 1, 1, 00),
        datetime(2011, 2, 1, 1, 00),
        datetime(2011, 3, 1, 1, 00),
        datetime(2011, 4, 1, 1, 00),
        datetime(2011, 5, 1, 1, 00),
        datetime(2011, 6, 1, 1, 00),
        datetime(2011, 7, 1, 1, 00),
        datetime(2011, 8, 1, 1, 00),
        datetime(2011, 9, 1, 1, 00),
        datetime(2011, 10, 1, 1, 00),
        datetime(2011, 11, 1, 1, 00)
    ]
    basedate = basedates[flag]
    trend = np.arange(0, len(data), dtype=np.intc)
    date = list(map(lambda x: basedate + timedelta(hours=int(x)), trend))
    weekday = list(map(lambda x: x.weekday(), date))
    month = list(map(lambda x: x.month, date))
    hour = list(map(lambda x: x.hour, date))

    dayofweek = np.zeros((len(data), 7))
    for i, w in enumerate(weekday):
        dayofweek[i, w] = 1

    dayofmonth = np.zeros((len(data), 12))
    for i, w in enumerate(month):
        dayofmonth[i, w - 1] = 1

    dayofhour = np.zeros((len(data), 24))
    for i, w in enumerate(hour):
        dayofhour[i, w - 1] = 1

    reshapeddata = np.zeros((data.shape[0], 20))

    for i in range(reshapeddata.shape[0]):
        reshapeddata[i][0] = data[i][0]
        # reshapeddata[i][1:25] = dayofhour[i]
        # reshapeddata[i][25:32] = dayofweek[i]
        # reshapeddata[i][32:44] = dayofmonth[i]
        reshapeddata[i][1:8] = dayofweek[i]
        reshapeddata[i][8:20] = dayofmonth[i]

    return reshapeddata
