from sqlalchemy import create_engine, text
import sys


def auto_gen_tables(engine):
    with engine.connect() as sqldb:
        sqldb.execute(text("drop table if exists ems_rtu_info"))
        sqldb.execute(text(
            "create table ems_rtu_info(id int, name text, ip_addr varchar2(64),"
            "port int, status int, refresh_time int)"))

        for rtu_id in range(1, 6):
            sqldb.execute(text(
                f"insert into ems_rtu_info (id, name, ip_addr, port, status, refresh_time)"
                f"values({rtu_id}, 'rtu_{rtu_id}','127.0.0.1',{8800 + rtu_id},0,0)"))

        results = sqldb.execute(text("select * from ems_rtu_info"))
        for result in results:
            print(result.id, result.name, result.ip_addr,
                  result.port, result.status, result.refresh_time)
        sqldb.commit()

def check_yk_change(rtu_id, yk):
    find_ele = yk_dic.get((rtu_id, yk[0]),None)
    if find_ele is None or find_ele != yk:
        yk_dic[(rtu_id, yk[0])] = yk
        return True
    return  False

def update_yk_data(sqldb,sock, rtu_id):
    print("update_yk_data ",rtu_id)
    results = sqldb.execute(text(f"select * from ems_yk_info "
                                 f"where rtu_id = {rtu_id}"))

    data = []
    for result in results:
        print(result)
        yk = [result.pnt_no, result.name, result.value,
              result.ret_code, result.ctrl_time]
        if check_yk_change(rtu_id, yk):
            data.append(yk)

    if len(data) >0:
        print("end update_yk_data ", rtu_id)
        send_data(sock,{"type": "update_yk"}, data)



if __name__ == "__main__":
    engine = create_engine("sqlite:///../db/ems.db")

    print(sys.argv)
    if len(sys.argv) > 1 and sys.argv[1] == 'init':
        auto_gen_tables(engine)
        exit(0)
