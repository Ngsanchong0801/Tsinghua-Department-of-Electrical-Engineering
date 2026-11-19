import socket
import struct
import json
import os

def get(conn, head_data):
    # 获取文件信息
    file_name = head_data['name']
    file_len = os.path.getsize(file_name)
    send_head = {"name": file_name, "size": file_len, "cmd": "get"}
    json_head = json.dumps(send_head).encode('utf8')

    # 发送报文头
    json_head_lens = struct.pack("i", len(json_head))
    conn.send(json_head_lens)
    conn.send(json_head)

    # 发送文件内容
    with open(file_name, "rb") as fp:
        send_len = 0
        while True:
            data = fp.read(10240)
            send_len += len(data)
            process = int(send_len * 100.0 / file_len)
            print(f"\r{'>' * process}{'-' * (100 - process)}{process}%", end='')
            if not data:
                break
            conn.send(data)
    print("上传成功")


def put(conn, head_data):
    file_name, file_len, file_cmd = head_data['name'], head_data['size'], head_data['cmd']
    with open(file_name, "wb") as fp:
        recv_len = 0
        while recv_len < file_len:
            this_len = 10240 if file_len - recv_len > 10240 else file_len - recv_len
            data = conn.recv(this_len)
            fp.write(data)
            recv_len += this_len


from multiprocessing import Process
def conn_thread(conn):
    print("new thread", conn)
    try:
        while True:
            head_recv = conn.recv(4)
            head_len = struct.unpack("i", head_recv)[0]

            head_recv = conn.recv(head_len)
            head_data = json.loads(head_recv)

            print("recv", head_data)

            file_cmd = head_data['cmd']

            func = globals().get(file_cmd, None)
            if func is None:
                raise ValueError(f"cmd error: {head_recv}")

            func(conn, head_data)

    except Exception as e:
        print("Error:", e)


def main():
    sock = socket.socket()
    sock.bind(("127.0.0.1", 8889))
    sock.listen(10)
    while True:
        conn, status = sock.accept()
        process = Process(target=conn_thread, args=(conn,))
        process.start()


if __name__ == "__main__":
    main()
