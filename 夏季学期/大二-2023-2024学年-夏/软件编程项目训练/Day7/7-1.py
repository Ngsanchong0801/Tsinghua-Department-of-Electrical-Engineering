import sys
from threading import Thread
from PyQt5.QtCore import QEvent, QCoreApplication, QThread
import json
import time
from bs4 import BeautifulSoup
import requests
import urllib.parse
from selenium import webdriver
import networkx as nx
import matplotlib.pyplot as plt
from testui import Ui_MainWindow
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox, QTableWidgetItem
from PyQt5 import QtCore, QtGui, QtWidgets

movie_list = []


def search_movies_by_person(person_id):
    global movie_list
    url = f'https://movie.douban.com/celebrity/{person_id}/movies'
    while True:
        print(url)
        browser = webdriver.Chrome()
        browser.get(url)
        soup = BeautifulSoup(browser.page_source, 'html.parser')
        movies = soup.select('#wrapper .article dd h6 a')
        for item in movies:
            name = item.text.strip()
            id = item['href'].strip().split('/')[-2]
            web = item['href']
            moive = (name, id, web)
            event = MoviesEvent(moive)
            QCoreApplication.postEvent(wnd, event)
            movie_list.append(moive)
            print(moive)
        time.sleep(1)
        if len(soup.select('.next a')) == 0:
            break
        url = f'https://movie.douban.com/celebrity/{person_id}/movies' + soup.select('.next a')[0]['href']
        print(url)
    return movie_list


def search_movie(movie_list):
    url = f'https://movie.douban.com/subject/{movie_list}/'
    browser = webdriver.Chrome()
    browser.get(url)
    soup = BeautifulSoup(browser.page_source, 'html.parser')
    daoyan = soup.select('[class="attrs"]')[0].text.strip()
    yanyuan = soup.select('[class="attrs"]')[1].text.strip()
    year = soup.select('[class="year"]')[0].text.strip()
    area = '中国大陆'
    neirong = soup.select('[property="v:summary"]')[0].text.strip()
    info = (daoyan, yanyuan, year, area, neirong)

    event = MovieInfo(info)
    QCoreApplication.postEvent(wnd, event)


def search_persons_by_moive(moive):
    list = []
    url = f'https://movie.douban.com/subject/{moive[1]}/celebrities'
    print(url)
    browser = webdriver.Chrome()
    browser.get(url)
    soup = BeautifulSoup(browser.page_source, 'html.parser')
    results = soup.select('.list-wrapper')
    for item in results:
        if (item.select('h2')[0].text.strip() == '演员 Cast'):
            members = item.select('li .name a')
            for member in members:
                name = member.text.strip().split(' ')[0]
                id = member['href'].strip().split('/')[-2]
                web = member['href']
                if name == ' ':
                    browser = webdriver.Chrome()
                    browser.get(web)
                    soup1 = BeautifulSoup(browser.page_source, 'html.parser')
                    name = soup1.select('h1')[0].text.strip().split(' ')[0]
                number = (name, id, web)
                list.append(number)
                print(number)
    time.sleep(0.5)
    return list


# 获取演员合作次数字典
# @checked
def draw():
    dic = {}
    for item in movie_list:
        numbers = search_persons_by_moive(item)
        for number in numbers:
            event = Raletive(number)
            QCoreApplication.postEvent(wnd, event)
            if number[0] in dic:
                dic[number[0]] += 1
            else:
                dic[number[0]] = 1
    print(dic)
    return dic


def draw_graph(person_name, num_dict, tp='spring', max_node=50):
    try:
        """
        rela_dict: 节点关系列表，比如：[('张国立', '王刚', 30), ('张国立', '张铁林', 5), ('张国立', '黄晓明', 2)]
        num_dict: 每个演员参与合作的电影数量比如：{'张国立':33,'王刚':30,'张铁林':5,'黄晓明':2}
        person_name: 演员名称
        tp: 图形分布类型（circular/spring/shell/spectral）
        max_node：待显示的节点数量，默认是50个
        """

        rela_list = [(person_name, person, num_dict[person]) for person in num_dict if person != person_name]

        plt.figure(figsize=(50, 50))

        if len(rela_list) > max_node:
            rela_list = sorted(rela_list, key=lambda x: x[2], reverse=True)
            rela_list = rela_list[0:max_node]
        for node in rela_list:
            print(node)

        G = nx.Graph()
        for u, v, w in rela_list:
            G.add_edge(u, v, weight=w)

        layout = tp + "_layout"

        attr = getattr(nx, layout)
        if not attr:
            print("can not find layout", tp)
            attr = nx.circular_layout
        pos = attr(G)
        # if tp == 'circular':
        #     pos = nx.circular_layout(G)  # 节点圆环分布
        # elif tp == 'spring':
        #     pos = nx.spring_layout(G)    # 节点放射分布
        # elif tp == 'shell':
        #     pos = nx.shell_layout(G)     # 节点同心圆分布，当节点较少时等同于圆环分布
        # elif tp == 'spectral':
        #     pos = nx.spectral_layout(G)    # 拉普拉斯特征向量分布
        # else:
        #     pos = nx.circular_layout(G)  # 节点圆环分布

        # 画边
        nx.draw_networkx_edges(G, pos, width=[d['weight'] for (u, v, d) in G.edges(data=True)], edge_color='green')
        # 画点
        # if num_dict:
        nx.draw_networkx_nodes(G, pos, node_size=[(num_dict[node]) * 800 for node in G.nodes()], node_color='red')
        # nx.draw_networkx_nodes(G, pos,  node_size= [(num_dict[node]) * 200 for node in G.nodes()], with_label=True, node_color='red')
        # 标记
        nx.draw_networkx_labels(G, pos, font_size=40, font_color='black', font_family='simhei')
        # 画图
        # plt.rcParams['figure.figsize'] = (80.0, 40.0)
        plt.savefig(person_name + ".png")
    except Exception as e:
        print(e)


def info(name):
    num_dict = draw()
    draw_graph(name, num_dict, 'spring')


class MoviesEvent(QEvent):
    idType = QEvent.registerEventType()

    def __init__(self, data):
        super(MoviesEvent, self).__init__(MoviesEvent.idType)
        self.data = data

    def getData(self):
        return self.data


class MovieInfo(QEvent):
    idType = QEvent.registerEventType()

    def __init__(self, data):
        super(MovieInfo, self).__init__(MovieInfo.idType)
        self.data = data

    def getData(self):
        return self.data


class Raletive(QEvent):
    idType = QEvent.registerEventType()

    def __init__(self, data):
        super(Raletive, self).__init__(Raletive.idType)
        self.data = data

    def getData(self):
        return self.data


def checked(func):
    def inner(*args, **kwargs):
        try:
            func(*args, **kwargs)
        except Exception as e:
            print(e)

    return inner


class UiWnd(QMainWindow):
    def __init__(self, Ui_MainWindow):
        super(UiWnd, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.counter = 0

    def search_person_by_name(self, name):
        url = 'https://search.douban.com/movie/subject_search?search_text=' + urllib.parse.quote(name)
        # user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'
        browser = webdriver.Chrome()
        browser.get(url)
        soup = BeautifulSoup(browser.page_source, 'html.parser')
        try:
            results = soup.select('#wrapper .detail .title a')
            if not results:
                raise Exception(f'没有{name}的信息...')
            else:
                results = soup.select('#wrapper .detail .title a')[0]
                name = results.text
                id = results['href'].strip().split('/')[-2]
                web = results['href']
                person = (name, id, web)
                print(person)
                return person
        except Exception as e:
            print(e)
            return None

    # 输入框输入演员姓名
    def editInfo(self):
        try:
            person_info = self.search_person_by_name(self.ui.editPersonName.text())
            print(self.ui.editPersonName.text())
            self.ui.tablePersonInfo.clear()
            # QMessageBox.information(self, 'warning消息框', self.ui.editPersonName.text())
            # self.ui.progressQueryBar.setValue(0)
            self.ui.tablePersonInfo.setRowCount(1)
            self.ui.tablePersonInfo.setColumnCount(3)
            self.ui.tablePersonInfo.setHorizontalHeaderLabels(['姓名', 'ID', '链接'])
            item = QTableWidgetItem(str(person_info[0]))
            self.ui.tablePersonInfo.setItem(0, 0, item)
            item = QTableWidgetItem(str(person_info[1]))
            self.ui.tablePersonInfo.setItem(0, 1, item)
            item = QTableWidgetItem(str(person_info[2]))
            self.ui.tablePersonInfo.setItem(0, 2, item)
        except Exception as e:
            print(e)

    # 按键获取演员信息
    def showButton1(self):
        self.ui.btnQueryPersonInfo.clicked.connect(lambda: self.editInfo())

    def editMoveListInfo(self):
        try:
            self.ui.tableMovieList.setRowCount(0)
            self.ui.tableMovieList.setColumnCount(3)
            self.ui.tableMovieList.setHorizontalHeaderLabels(['电影名', 'ID', '链接'])
            t = Thread(target=search_movies_by_person, args=(self.ui.tablePersonInfo.item(0, 1).text(),))
            t.start()
        except Exception as e:
            print('editMoveListInfo: ', e)

    # 点下按钮，开启一个新的线程，返回电影列表
    def showButton2(self):
        self.ui.btnQueryMovieList.clicked.connect(lambda: self.editMoveListInfo())

    def movieInfoShow(self):
        try:
            self.ui.tableMovieInfo.setColumnCount(1)
            self.ui.tableMovieInfo.setRowCount(5)
            self.ui.tableMovieInfo.setVerticalHeaderLabels(['国家', '时间', '导演', '演员', '简介'])
            t = Thread(target=search_movie, args=(self.ui.tableMovieList.selectedItems()[0].text(),))
            print(self.ui.tableMovieList.selectedItems()[0].text())
            t.start()
        except Exception as e:
            print('movieInfoShow: ', e)

    # 点下按钮，开启一个新的线程，返回电影信息
    def showButton3(self):
        self.ui.btnQueryMovieInfo.clicked.connect(lambda: self.movieInfoShow())

    def relativePicture(self):
        try:
            t = Thread(target=info, args=(self.ui.editPersonName.text(),))
            t.start()
        except Exception as e:
            print('relativePicture: ', e)

    def showButton4(self):
        self.ui.btnGenRelativeGraph.clicked.connect(lambda: self.relativePicture())

    def customEvent(self, event) -> None:
        try:
            if event.type() == MoviesEvent.idType:
                print('ghrweiuiogrenbiothen')
                info = event.getData()
                print(info)
                row = self.ui.tableMovieList.rowCount()
                self.ui.tableMovieList.insertRow(self.ui.tableMovieList.rowCount())
                item = QTableWidgetItem(str(info[0]))
                self.ui.tableMovieList.setItem(row, 0, item)
                item = QTableWidgetItem(str(info[1]))
                self.ui.tableMovieList.setItem(row, 1, item)
                item = QTableWidgetItem(str(info[2]))
                self.ui.tableMovieList.setItem(row, 2, item)
                while self.counter < 100:
                    self.counter += 10
                    self.ui.progressQueryBar.setValue(self.counter)
                self.ui.progressQueryBar.setValue(0)

            if event.type() == MovieInfo.idType:
                info = event.getData()
                item = QTableWidgetItem(str(info[3]))
                self.ui.tableMovieInfo.setItem(0, 0, item)
                item = QTableWidgetItem(str(info[2]))
                self.ui.tableMovieInfo.setItem(1, 0, item)
                item = QTableWidgetItem(str(info[0]))
                self.ui.tableMovieInfo.setItem(2, 0, item)
                item = QTableWidgetItem(str(info[1]))
                self.ui.tableMovieInfo.setItem(3, 0, item)
                item = QTableWidgetItem(str(info[4]))
                self.ui.tableMovieInfo.setItem(4, 0, item)
                while self.counter < 100:
                    self.counter += 10
                    self.ui.progressQueryBar.setValue(self.counter)

            if event.type() == Raletive.idType:
                while self.counter < 100:
                    self.counter += 10
                    self.ui.progressQueryBar.setValue(self.counter)

        except Exception as e:
            print('customEvent:', e)

    def OnQueryMovieList(self, bChecked=False):
        try:
            self.person_relative_dic[self.person] = None
            if self.query_moive_list:
                self.query_moive_list = False
                return
        except Exception as e:
            print('OnQueryMovieList: ', e)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    wnd = UiWnd(Ui_MainWindow)
    # wnd.btnPersonInfo()
    wnd.showButton1()
    wnd.showButton2()
    wnd.showButton3()
    wnd.showButton4()
    wnd.show()
    sys.exit(app.exec())
