package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class organicremedies : AppCompatActivity() {
    lateinit var getstartButton: AppCompatButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_organicremedies)
        getstartButton = findViewById(R.id.button16)
        getstartButton.setOnClickListener {
            val intent = Intent(this,bananatea::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button24)
        getstartButton.setOnClickListener {
            val intent = Intent(this,garlicinfusion::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button25)
        getstartButton.setOnClickListener {
            val intent = Intent(this,eggshells::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button26)
        getstartButton.setOnClickListener {
            val intent = Intent(this,nettlepurin::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button27)
        getstartButton.setOnClickListener {
            val intent = Intent(this,fungicidemilk::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.button28)
        getstartButton.setOnClickListener {
            val intent = Intent(this,lentilrooting::class.java)
            startActivity(intent)
        }
    }
}