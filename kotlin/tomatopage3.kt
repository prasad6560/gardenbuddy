package com.simats.gardenbuddy

import android.os.Bundle
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class tomatopage3 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_tomatopage3)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val nutrient = intent.getStringExtra("NUTRIENT")
        val disease = intent.getStringExtra("DISEASE")
        val textView = findViewById<TextView>(R.id.nutrients_description)
        textView.text = nutrient

        val diseases_section = findViewById<TextView>(R.id.diseases_section)
        diseases_section.text = disease


    }
}