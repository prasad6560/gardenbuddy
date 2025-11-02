package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class plaguesanddiseases : AppCompatActivity() {
    lateinit var getstartButton: AppCompatButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_plaguesanddiseases)
        getstartButton = findViewById(R.id.button16)
        getstartButton.setOnClickListener {
            val intent = Intent(this,powderymildew::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button24)
        getstartButton.setOnClickListener {
            val intent = Intent(this,leafspot::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button25)
        getstartButton.setOnClickListener {
            val intent = Intent(this,nematodes::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button26)
        getstartButton.setOnClickListener {
            val intent = Intent(this,aphids::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button27)
        getstartButton.setOnClickListener {
            val intent = Intent(this,redspider::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button28)
        getstartButton.setOnClickListener {
            val intent = Intent(this,downymildew ::class.java)
            startActivity(intent)
        }
    }
}