package com.example.applab1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class DisplayRestaurantInfoActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_restaurant_info);

        TextView tvRestaurantName = findViewById(R.id.tvRestaurantName);
        TextView tvAddress = findViewById(R.id.tvAddress);
        TextView tvPhone = findViewById(R.id.tvPhone);
        TextView tvCuisine = findViewById(R.id.tvCuisine);
        TextView tvAprice= findViewById(R.id.tvAprice);
        Intent intent = getIntent();
        if(intent != null) {
            String restaurantName = intent.getStringExtra("RESTAURANT_NAME");
            String address = intent.getStringExtra("ADDRESS");
            String phone = intent.getStringExtra("PHONE");
            String cusine = intent.getStringExtra("Cuisine");
            String aprice = intent.getStringExtra("Avg Price");
            tvRestaurantName.setText("RESTAURANT NAME: "+restaurantName);
            tvAddress.setText("ADDRESS: "+address);
            tvPhone.setText("PHONE: "+ phone);
            tvCuisine.setText("CUISINE: "+ cusine);
            tvAprice.setText("AVG PRICE: "+ aprice);
        }
    }

}