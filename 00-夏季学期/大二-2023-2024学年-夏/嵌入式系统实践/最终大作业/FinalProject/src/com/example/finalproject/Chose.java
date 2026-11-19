package com.example.finalproject;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Chose extends Activity {

    private SharedPreferences prefs;

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 123 && resultCode == RESULT_OK) {
            TextView textView2 = (TextView) findViewById(R.id.textView2);
            String str = data.getStringExtra("addText");
            String ifClear = data.getStringExtra("ifClear");
            if (ifClear.equals("1")) {
                textView2.setText(str);
            } else {
                String formerStr = textView2.getText().toString();
                textView2.setText(formerStr + "\n" + str);
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        // 从 SharedPreferences 中读取数据并更新 TextView1 的文本
        TextView memo = (TextView) findViewById(R.id.textView2);
        String memoText = prefs.getString("RECORD_MEMO", "");
        memo.setText(memoText);
    }

    @Override
    protected void onPause() {
        super.onPause();
        // 将 TextView1 的文本存储到 SharedPreferences 中
        TextView memo = (TextView) findViewById(R.id.textView2);
        SharedPreferences.Editor prefEdit = prefs.edit();
        prefEdit.putString("RECORD_MEMO", memo.getText().toString());
        prefEdit.apply();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chose);

        // 获取 SharedPreferences 对象
        prefs = getSharedPreferences("myPrefs", MODE_PRIVATE);

        Button button1 = (Button) findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Chose.this, Cal.class);
                startActivity(intent);
            }
        });


        Button button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Chose.this, Check.class);
                startActivity(intent);
            }
        });


        Button button3 = (Button) findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Chose.this, Note.class);
                startActivityForResult(intent, 123);
            }
        });

    }
}