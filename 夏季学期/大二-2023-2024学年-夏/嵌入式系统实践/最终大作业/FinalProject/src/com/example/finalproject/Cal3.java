package com.example.finalproject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class Cal3 extends Activity {

    private EditText editText1;
    private EditText editText2;
    private EditText editText3;
    private TextView textView2;
    private TextView textView3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cal3);

        editText1 = (EditText) findViewById(R.id.editText1);
        editText2 = (EditText) findViewById(R.id.editText2);
        editText3 = (EditText) findViewById(R.id.editText3);

        textView2 = (TextView) findViewById(R.id.textView2);
        textView3 = (TextView) findViewById(R.id.textView3);

        Button button1 = (Button) findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                calculate();
            }
        });

        Button button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Cal3.this, Cal.class);
                startActivityForResult(intent, 1);
            }
        });
    }

    private void calculate() {
        double a = Double.parseDouble(editText1.getText().toString());
        double b = Double.parseDouble(editText2.getText().toString());
        double c = Double.parseDouble(editText3.getText().toString());

        double discriminant = b * b - 4 * a * c;

        if (discriminant < 0) {
            // 没有实根
            textView2.setText("");
            textView3.setText("");
        } else if (discriminant == 0) {
            // 一个实根
            double x1 = -b / (2 * a);
            textView2.setText("x = " + x1);
            textView3.setText("");
        } else {
            // 两个实根
            double x1 = (-b + Math.sqrt(discriminant)) / (2 * a);
            double x2 = (-b - Math.sqrt(discriminant)) / (2 * a);
            textView2.setText("x1 = " + x1);
            textView3.setText("x2 = " + x2);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == 1) {
            if (resultCode == RESULT_OK) {
                double x1 = data.getDoubleExtra("x1", 0);
                double x2 = data.getDoubleExtra("x2", 0);

                if (x1 == x2) {
                    textView2.setText("x = " + x1);
                    textView3.setText("");
                } else {
                    textView2.setText("x1 = " + x1);
                    textView3.setText("x2 = " + x2);
                }
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.cal3, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}