import socket
import os
import json
import struct


def put(sock, file_name):
    data_len = os.path.getsize(file_name)
    data_head = {"name": file_name, "size": data_len, "cmd": "put"}
    json_head = json.dumps(data_head).encode('utf8')

    # 发送报文头
    json_head_lens = struct.pack("i", len(json_head))
    sock.send(json_head_lens)
    sock.send(json_head)

    # 发送文件内容
    with open(file_name, "rb") as fp:
        send_len = 0
        while True:
            data = fp.read(10240)
            send_len += len(data)
            if not data:
                break
            process = int(send_len * 100.0 / data_len)
            print(f"\r{'>' * process}{'-' * (100 - process)}{process}%", end='')
            sock.send(data)
    print("上传成功")


def get(sock, file_name):
    data_head = {"name": file_name, "cmd": "get"}
    json_head = json.dumps(data_head).encode('utf8')

    # 发送报文头
    json_head_lens = struct.pack("i", len(json_head))
    sock.send(json_head_lens)
    sock.send(json_head)

    # 接受报文头
    head_recv = sock.recv(4)
    head_len = struct.unpack("i", head_recv)[0]

    head_recv = sock.recv(head_len)
    head_data = json.loads(head_recv)

    file_name, file_len = head_data['name'], head_data['size']

    # 接受文件信息
    with open(file_name, "wb") as fp:
        recv_len = 0
        while recv_len < file_len:
            this_len = 10240 if file_len - recv_len > 10240 else file_len - recv_len
            data = sock.recv(this_len)
            fp.write(data)
            fp.flush()
            recv_len += this_len
            process = int(recv_len * 100.0 / file_len)
            print(f"\r{'>' * process}{'-' * (100 - process)}{process}%", end='')

    print("\n下载成功")


def cwd(sock):
    print(os.getcwd())


def cd(sock, dir_name):
    if not os.path.isdir(dir_name):
        raise ValueError(f"文件夹{dir_name}为空。。。。")
    os.chdir(dir_name)


def quit(sock):
    exit(0)


def ls(sock):
    list_dir = os.listdir()
    for dir in list_dir:
        if os.path.isdir(dir):
            print(dir.ljust(64), "dir")
        else:
            print(dir.ljust(64), "file")


def main():
    sock = socket.socket()
    sock.connect(("127.0.0.1", 8889))
    while True:
        try:
            cmd = input("请输入命令:>>").strip()
            cmds = cmd.split(" ")
            if len(cmds) == 0 or cmds[0] == '':
                raise ValueError("cmd is None")
            func = globals().get(cmds[0], None)
            if func is None:
                raise ValueError(f"error cmd: {cmd}")
            func(sock, *cmds[1:])
        except Exception as e:
            print(e)


if __name__ == "__main__":
    main()
