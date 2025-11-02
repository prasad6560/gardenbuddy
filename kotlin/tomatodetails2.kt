package com.simats.gardenbuddy

import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.bumptech.glide.Glide
import com.simats.gardenbuddy.Api.RetrofitClient.IMAGE_PATH

class tomatodetails2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_tomatodetails2)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val planting = intent.getStringExtra("PLANTING")
        val plantingImage = intent.getStringExtra("PLANTING_IMAGE")
        val watering = intent.getStringExtra("WATERING")

        val textView = findViewById<TextView>(R.id.textView14)
        textView.text = planting

        val imageView5 = findViewById<ImageView>(R.id.imageView5)

        Glide.with(this)
            .load(IMAGE_PATH+plantingImage)
            .placeholder(R.drawable.pots)
            .into(imageView5)


        val textView2 = findViewById<TextView>(R.id.textView17)
        textView2.text = watering
    }
}