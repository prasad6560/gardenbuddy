package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class adminuser : AppCompatActivity() {
    lateinit var getstartButton: AppCompatButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_adminuser)
        getstartButton = findViewById(R.id.btn_admin)
        getstartButton.setOnClickListener {
            val intent = Intent(this,adminlogin::class.java)
            startActivity(intent)
        }
        getstartButton = findViewById(R.id.btn_user)
        getstartButton.setOnClickListener {
            val intent = Intent(this,register::class.java)
            startActivity(intent)
        }
    }
}