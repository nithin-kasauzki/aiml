package com.example.applab3;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class UserDetailsActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_details);

        TextView tvDetails = findViewById(R.id.tvDetails);

        String userDetails = "Name: " + getIntent().getStringExtra("Name") + "\n" +
                "Email: " + getIntent().getStringExtra("Email") + "\n" +
                "Phone: " + getIntent().getStringExtra("Phone");

        tvDetails.setText(userDetails);
    }
}
