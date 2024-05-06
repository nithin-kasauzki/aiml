package com.example.applab1;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText editTextRestaurantName;
    private EditText editTextAddress;
    private EditText editTextPhone;
    private EditText editCuisine;
    private EditText editAvgPrice;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.restaurant);
         editTextAddress = findViewById(R.id.editTextAddress);
         editTextPhone = findViewById(R.id.editTextPhone);
        editTextRestaurantName = findViewById(R.id.editTextRestaurantName);
        editCuisine = findViewById(R.id.editTextCuisine);
        editAvgPrice = findViewById(R.id.editTextAveragePrice);

        Button submitBtn = findViewById(R.id.submitBtn);
        submitBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                submitForm();
            }
        });
    }

    private void submitForm() {
        String restaurantName = editTextRestaurantName.getText().toString();
        String address = editTextAddress.getText().toString();
        String phone = editTextPhone.getText().toString();
        String cusine = editCuisine.getText().toString();
        String aprice = editAvgPrice.getText().toString();
        Intent intent = new Intent(this, DisplayRestaurantInfoActivity.class);
        intent.putExtra("RESTAURANT_NAME", restaurantName);
        intent.putExtra("ADDRESS", address);
        intent.putExtra("PHONE", phone);
        intent.putExtra("Cuisine", cusine);
        intent.putExtra("Avg Price", aprice);

        startActivity(intent);
    }

}
