package com.example.applab3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    private EditText etName, etEmail, etPhoneNumber, etOTP;
    private Button btnSendOTP, btnVerifyOTP;
    private String generatedOTP;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etName = findViewById(R.id.etName);
        etEmail = findViewById(R.id.etEmail);
        etPhoneNumber = findViewById(R.id.etPhoneNumber);
        etOTP = findViewById(R.id.etOTP);
        btnSendOTP = findViewById(R.id.btnSendOTP);
        btnVerifyOTP = findViewById(R.id.btnVerifyOTP);

        btnSendOTP.setOnClickListener(view -> sendOTP());
        btnVerifyOTP.setOnClickListener(view -> verifyOTP());
    }

    private void sendOTP() {
        generatedOTP = generateRandomOTP(6);
        Toast.makeText(this, "OTP: " + generatedOTP, Toast.LENGTH_LONG).show();
    }

    private void verifyOTP() {
        String otp = etOTP.getText().toString();
        if (otp.equals(generatedOTP)) {
            Intent intent = new Intent(this, UserDetailsActivity.class);
            intent.putExtra("Name", etName.getText().toString());
            intent.putExtra("Email", etEmail.getText().toString());
            intent.putExtra("Phone", etPhoneNumber.getText().toString());
            startActivity(intent);
        } else {
            Toast.makeText(this, "Invalid OTP, please try again.", Toast.LENGTH_LONG).show();
        }
    }

    private String generateRandomOTP(int length) {
        StringBuilder otp = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            otp.append(random.nextInt(10)); // Append a random digit (0-9)
        }
        return otp.toString();
    }
}
