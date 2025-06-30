package com.example.finalproject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;

public class Cal extends Activity {

	private EditText editText1;
	private EditText editText2;
	private RadioButton Add;
	private RadioButton Subtract;
	private RadioButton Multiply;
	private RadioButton Divide;
	private Button button1;
	private Button button2;
	private Button button3;
	private TextView textView3;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_cal);

		editText1 = (EditText) findViewById(R.id.editText1);
		editText2 = (EditText) findViewById(R.id.editText2);
		Add = (RadioButton) findViewById(R.id.radioButton1);
		Subtract = (RadioButton) findViewById(R.id.radioButton2);
		Multiply = (RadioButton) findViewById(R.id.radioButton3);
		Divide = (RadioButton) findViewById(R.id.radioButton4);
		button1 = (Button) findViewById(R.id.button1);
		button2 = (Button) findViewById(R.id.button2);
		button3 = (Button) findViewById(R.id.button3);
		textView3 = (TextView) findViewById(R.id.textView3);

		button1.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				double num1 = Double.parseDouble(editText1.getText().toString());
				double num2 = Double.parseDouble(editText2.getText().toString());
				double result = 0;

				if (Add.isChecked()) {
					result = num1 + num2;
				} else if (Subtract.isChecked()) {
					result = num1 - num2;
				} else if (Multiply.isChecked()) {
					result = num1 * num2;
				} else if (Divide.isChecked()) {
					result = num1 / num2;
				}

				textView3.setText("µª®×:" + String.valueOf(result));
			}
		});
		

		button2.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(Cal.this, Cal2.class);
				startActivity(intent);
			}
		});

		
		button3.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(Cal.this, Chose.class);
				startActivity(intent);
			}
		});
		

		Button button4 = (Button) findViewById(R.id.button4);
		button4.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(Cal.this, Cal3.class);
				startActivity(intent);
			}
		});
	}
}