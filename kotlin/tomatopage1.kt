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

class tomatopage1 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_tomatopage1)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val containerLiters = intent.getStringExtra("CONTAINER_LITERS")
        val containerImage = intent.getStringExtra("CONTAINER_IMAGE")
        val soilType = intent.getStringExtra("SOIL_TYPE")
        val soilPreparation = intent.getStringExtra("SOIL_PREPARATION")
        val planting = intent.getStringExtra("PLANTING")

        val textView = findViewById<TextView>(R.id.textView2)
        textView.text = containerLiters

        val imageView = findViewById<ImageView>(R.id.imageView)
        Glide.with(this)
            .load(IMAGE_PATH+containerImage)
            .placeholder(R.drawable.pots)
            .into(imageView)


    }
}