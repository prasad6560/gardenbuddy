package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class MainActivity : AppCompatActivity() {
    lateinit var getstartButton: AppCompatButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        getstartButton = findViewById(R.id.startbutton)
        getstartButton.setOnClickListener {
            val intent = Intent(this, adminuser::class.java)
            startActivity(intent)
        }
    }
}