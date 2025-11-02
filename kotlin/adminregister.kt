package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class adminregister : AppCompatActivity() {
    lateinit var getstartButton: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_adminregister)
        getstartButton = findViewById(R.id.login_text)
        getstartButton.setOnClickListener {
            val intent = Intent(this,adminlogin::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.register_button)
        getstartButton.setOnClickListener {
            val intent = Intent(this,HomeActivity::class.java)
            startActivity(intent)
        }


    }
}