import socket
import sys
import time
from threading import Thread
from multiprocessing import Process
from sqlalchemy import create_engine, text

rtu_addr = ('127.0.0.1', 8800)

yc_dic = {}
yx_dic = {}


def check_yc_change(li):
    find_ele = yc_dic.get(li[0], None)
    if find_ele is None or abs(find_ele[2] - li[2]) > 1e-6 or find_ele[3] != li[3] or find_ele[4] != li[4]:
        yc_dic[li[0]] = li
        return True
    return False


def update_yc_data(sqldb, conn):
    results = sqldb.execute(text("select * from rtu_yc_info"))
    data = []
    for result in results:
        li = [result.id, result.name, result.value,
              result.status, result.refresh_time]
        if check_yc_change(li):
            data.append(li)

    if len(data) > 0:
        send_data(conn, {"type": "update_yc"}, data)


def check_yx_change(li):
    find_ele = yx_dic.get(li[0], None)
    if find_ele is None or find_ele != li:
        yc_dic[li[0]] = li
        return True
    return False


def update_yx_data(sqldb, conn):
    results = sqldb.execute(text("select * from rtu_yx_info"))
    data = []
    for result in results:
        li = [result.id, result.name, result.value,
              result.status, result.refresh_time]
        if check_yx_change(li):
            data.append(li)

    if len(data) > 0:
        send_data(conn, {"type": "update_yx"}, data)


def auto_gen_tables(engine, rtu_id):
    with engine.connect() as sqldb:
        sqldb.execute(text("drop table if exists rtu_info"))
        sqldb.execute(text(
            "create table rtu_info(id int, name text, ip_addr varchar(64),"
            "port int, status int, refresh_time int)"))

        sqldb.execute(text(
            f"insert into rtu_info (id, name, ip_addr, port, status, refresh_time) "
            f"values({rtu_id}, 'rtu_{rtu_id}','127.0.0.1', {8800 + rtu_id},0,0)"))
        sqldb.commit()


def get_ip_addr(engine, rtu_id):
    with engine.connect() as sqldb:
        results = sqldb.execute(text(f"select * from rtu_info "
                                     f"where id = {rtu_id}"))
        for result in results:
            return result.ip_addr, result.port


def rtu_thread_send_ycyx(engine, conn):
    while True:
        time.sleep(1.0)


def send_data(conn, data):
    pass


def rtu_main(rtu_id, b_init):
    engine = create_engine(f"sqlite:///db/rtu_{rtu_id}.db")
    if b_init:
        auto_gen_tables(engine, rtu_id)
        return
    rtu_addr = get_ip_addr(engine, rtu_id)
    print("rtu_addr:", rtu_addr)
    sock = socket.socket()
    sock.bind(rtu_addr)
    sock.listen(10)

    while True:
        conn, status = sock.accept()
        thread = Thread(target=rtu_thread_update, args=(engine, conn))
        thread.start()
        thread = Thread(target=rtu_thread_recv_data, args=(engine, conn))
        thread.start()


if __name__ == "__main__":
    rtu_id = -1
    b_init = False
    if "init" in sys.argv:
        b_init = True
        sys.argv.remove("init")

    if len(sys.argv) > 1:
        rtu_id = int(sys.argv[1])

    if rtu_id > 0:
        rtu_main(rtu_id, b_init)
        exit()

    for rtu in range(1, 6):
        process = Process(target=rtu_main, args=(rtu, b_init))
        process.start()
