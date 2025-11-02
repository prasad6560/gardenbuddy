package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity

class potorchard : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_potorchard)

        // ImageView for "Find Space"
        val findSpaceImage = findViewById<ImageView>(R.id.imageView9)
        findSpaceImage.setOnClickListener {
            val intent = Intent(this, findspace::class.java)
            startActivity(intent)
        }

        // ImageView for "Types of Pots"
        val typesOfPotsImage = findViewById<ImageView>(R.id.imageView11)
        typesOfPotsImage.setOnClickListener {
            val intent = Intent(this, typesofpots::class.java)
            startActivity(intent)
        }

        // ImageView for "Tools"
        val toolsImage = findViewById<ImageView>(R.id.imageView13)
        toolsImage.setOnClickListener {
            val intent = Intent(this, tools::class.java)
            startActivity(intent)
        }
    }
}
