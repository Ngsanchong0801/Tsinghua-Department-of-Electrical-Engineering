package com.example.day5;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class Weathersub extends Activity {
    private ArrayAdapter<String> adapter;
    private ArrayList<String> mArrayList;
    private ListView mList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_weathersub);

        mList = (ListView) findViewById(R.id.listView1);
        mArrayList = new ArrayList<String>();
        mArrayList.add("No:1 101010100 北京北京");
        mArrayList.add("No:2 101010200 北京海淀");
        mArrayList.add("No:3 101010300 北京朝阳");
        mArrayList.add("No:4 101010400 北京顺义");
        mArrayList.add("No:5 101010500 北京怀柔");
        mArrayList.add("No:6 101010600 北京通州");
        mArrayList.add("No:7 101010700 北京昌平");
        mArrayList.add("No:8 101010800 北京延庆");
        mArrayList.add("No:9 101010900 北京丰台");
        mArrayList.add("No:10 101011100 北京石景山");

        adapter = new ArrayAdapter<String>(Weathersub.this, android.R.layout.simple_list_item_1, mArrayList);
        mList.setAdapter(adapter);

        mList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String item = (String) parent.getItemAtPosition(position);
                String cityId = item.substring(item.lastIndexOf(" ") + 1);
                queryWeatherData(cityId);
            }
        });
    }

    void queryWeatherData(String cityId) {
        final String address = "http://v0.yiketianqi.com/api?unescape=1&version=v62&appid=xxx&appsecret=yyyy&cityid="
                + cityId;
        Log.d("Weather", address);
        //TextView city_weather = (TextView) findViewById(R.id.city_weather);
        HttpURLConnection con = null;
        try {
            URL url = new URL(address);
            con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setConnectTimeout(8000);
            con.setReadTimeout(8000);
            InputStream in = con.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            StringBuilder response = new StringBuilder();
            String str;
            while ((str = reader.readLine()) != null) {
                response.append(str);
            }
            Log.d("Weather OK", response.toString());
            Log.d("Weather", str);
        } catch (Exception e) {
            Log.d("Weather", e.getMessage());
            //city_weather.setText(e.getMessage());
        }
    }
    
   /* public void onClick(View view) {
    	if (view.getId() == R.id.title_update_btn) {
    		
    		if (NetUtil.getNetworkState(this) != NetUtil.NETWORN_NONE) {
    			Log.d("m卜Weather"."网终OK");
    			queryWeatherCode(cityCode);
    		}
    		else 
    		{
    			Log.d("myWeather"，"网络挂了");
    			Toast.makeText(MainActivity.this,"网络挂了!",Toast.LENGTH LONG).show();
    		}
    	}*/
    }

  