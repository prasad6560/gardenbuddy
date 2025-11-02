package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class tipstable : AppCompatActivity() {
    lateinit var getstartButton: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tipstable)
        getstartButton = findViewById(R.id.textView)
        getstartButton.setOnClickListener {
            val intent = Intent(this,potorchard::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.compost)
        getstartButton.setOnClickListener {
            val intent = Intent(this,compost::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.vermicomposting)
        getstartButton.setOnClickListener {
            val intent = Intent(this,vermicomposting::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.organicremedies)
        getstartButton.setOnClickListener {
            val intent = Intent(this,organicremedies::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.plaguesanddiseases)
        getstartButton.setOnClickListener {
            val intent = Intent(this,plaguesanddiseases::class.java)
            startActivity(intent)
        }


    }
}