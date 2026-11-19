package com.example.day5;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class Bluetooth extends Activity implements View.OnClickListener, AdapterView.OnItemClickListener {

    private final int CONNECTED = 1000;
    private final int DISCONNECTED = 1001;
    private int state = DISCONNECTED;
    private ComThread mThread = null;
    private BluetoothAdapter bluetoothAdapter;
    private ArrayAdapter<String> deviceAdapter;
    private List<String> listDevices;
    private TextView textData;
    private EditText editSend;
    public BluetoothSocket mSocket;
    private BroadcastReceiver receiver;
    private ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bluetooth);
        initial();
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        listDevices = new ArrayList<>();
        deviceAdapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, listDevices);
        listView.setAdapter(deviceAdapter);
    }

    private void initial() {
        listView = (ListView) findViewById(R.id.listView1);
        Button btn_1 = (Button) findViewById(R.id.button1);
        Button btn_2 = (Button) findViewById(R.id.button2);
        btn_1.setOnClickListener(this);
        btn_2.setOnClickListener(this);
        listView.setOnItemClickListener(this);
        editSend = (EditText) findViewById(R.id.editText1);
        textData = (TextView) findViewById(R.id.textView1);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
        if (!bluetoothAdapter.isEnabled()) {
            showToast("找不到");
        } else {
            bluetoothAdapter.cancelDiscovery();
            String str = listDevices.get(position);
            String macAddress = str.split("\\|")[1];
            BluetoothDevice device = bluetoothAdapter.getRemoteDevice(macAddress);

            try {
                Method clientMethod = device.getClass().getMethod("createRfcommSocket", int.class);
                mSocket = (BluetoothSocket) clientMethod.invoke(device, 1);
                mSocket.connect();

                if (mSocket.isConnected()) {
                    showToast("连接成功");
                    listView.setVisibility(View.GONE);
                    mThread = new ComThread(mSocket);
                    mThread.start();
                    textData.setVisibility(View.VISIBLE);
                    state = CONNECTED;
                } else {
                    showToast("連接失敗");
                    mSocket.close();
                    listView.setVisibility(View.VISIBLE);
                }
            } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.button2) {
            registerDeviceReceiver();
        } else if (v.getId() == R.id.button1) {
            sendData();
        }
    }

    private void registerDeviceReceiver() {
        receiver = new BroadcastReceiver() {
            public void onReceive(Context context, Intent intent) {
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                String str = device.getName() + "|" + device.getAddress();
                if (listDevices.indexOf(str) == -1) {
                    listDevices.add(str);
                }
                deviceAdapter.notifyDataSetChanged();
            }
        };

        if (bluetoothAdapter.isEnabled()) {
            listDevices.clear();
            deviceAdapter.notifyDataSetChanged();
            bluetoothAdapter.startDiscovery();
            showToast("哈哈");
            IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_FOUND);
            registerReceiver(receiver, filter);
        }
    }

    private void sendData() {
        if (state == CONNECTED && mThread != null) {
            String info = editSend.getText().toString();
            textData.setText("Send Data:" + info + "\r\n");
            mThread.write(info.getBytes());
        }
    }

    private void showToast(String message) {
        Toast.makeText(getApplicationContext(), message, Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onDestroy() {
        if (bluetoothAdapter != null && bluetoothAdapter.isDiscovering()) {
            bluetoothAdapter.cancelDiscovery();
        }
        unregisterReceiver(receiver);
        super.onDestroy();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            // Handle settings option here if necessary
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    class ComThread extends Thread {

        private final BluetoothSocket mmSocket;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;

        public ComThread(BluetoothSocket socket) {
            mmSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;

            try {
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }

            mmInStream = tmpIn;
            mmOutStream = tmpOut;
        }

        public void run() {
            byte[] buffer = new byte[1024];
            int bytes;

            while (true) {
                try {
                    bytes = mmInStream.read(buffer);
                    if (bytes != 0) {
                        String str = new String(buffer, 0, bytes, "UTF-8");
                        textData.append("Receive Data:" + str + "\r\n");
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    break;
                }
            }
        }

        public void write(byte[] bytes) {
            try {
                mmOutStream.write(bytes);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public void cancel() {
            try {
                mmSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}