package com.example.finalproject;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TimePicker;

public class Note extends Activity implements OnClickListener {
	private String hour = "12";
	private String min = "00";
	private String backStr;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_note);
		TimePicker times = (TimePicker)findViewById(R.id.timePicker1);
		times.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
            @Override
            public void onTimeChanged(TimePicker view, int hourOfDay, int minute) {
                hour = Integer.toString(hourOfDay);
                min = Integer.toString(minute);
            }
        });

		Button btn_add = (Button)findViewById(R.id.button1);
		Button btn_return = (Button)findViewById(R.id.button2);
		btn_add.setOnClickListener(this);
		btn_return.setOnClickListener(this);
	}
	
	
	public void onClick(View v) {
		EditText editText1 = (EditText)findViewById(R.id.editText1);
		CheckBox check1 = (CheckBox)findViewById(R.id.checkBox1);
		TextView preview = (TextView)findViewById(R.id.textView1);
		if(v.getId() == R.id.button1) {
			backStr = hour + "時" + min + "分" + editText1.getText().toString();
			preview.setText("記得" + backStr);
		}
		
		else if(v.getId() == R.id.button2) {
			Intent i = new Intent();
			i.putExtra("addText", backStr);
			if(check1.isChecked()) {
				i.putExtra("ifClear", "1");
			}
			else {
				i.putExtra("ifClear", "0");
			}
			setResult(RESULT_OK,i);
			finish();
			

		}
	}

	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.note, menu);
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