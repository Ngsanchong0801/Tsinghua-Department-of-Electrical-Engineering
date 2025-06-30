package com.example.finalproject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;

public class Cal2 extends Activity {

	
	private EditText editText1;
	private RadioButton square;
	private RadioButton squareRoot;
	private RadioButton log;
	private Button button1;
	private Button button2;
	private TextView textView2;

	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_cal2);

		editText1 = (EditText) findViewById(R.id.editText1);
		square = (RadioButton) findViewById(R.id.radioButton1);
		squareRoot = (RadioButton) findViewById(R.id.radioButton2);
		log = (RadioButton) findViewById(R.id.radioButton3);
		button1 = (Button) findViewById(R.id.button1);
		button2 = (Button) findViewById(R.id.button2);
		textView2 = (TextView) findViewById(R.id.textView2);

		
		button1.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				double num = Double.parseDouble(editText1.getText().toString());
				double result = 0;

				if (square.isChecked()) {
					result = num * num;
				} else if (squareRoot.isChecked()) {
					result = Math.sqrt(num);
				} else if (log.isChecked()) {
					result = Math.log10(num);
				}

				textView2.setText("µª®×:" + String.valueOf(result));
			}
		});

		
		button2.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(Cal2.this, Cal.class);
				startActivity(intent);
			}
		});
	}
}