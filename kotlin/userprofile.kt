package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import android.widget.Toast

class userprofile : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_userprofile)

        val profileImage = findViewById<ImageView>(R.id.imageView22)
        val editIcon = findViewById<ImageView>(R.id.imageView23)
        val emailField = findViewById<EditText>(R.id.editTextEmail)
        val passwordField = findViewById<EditText>(R.id.editTextPassword)
        val logoutButton = findViewById<Button>(R.id.button2)

        // Get user info from Intent extras
        val email = intent.getStringExtra("email") ?: ""
        emailField.setText(email)
        passwordField.setText("")

        // Logout logic
        logoutButton.setOnClickListener {
            // TODO: Clear session if using SharedPreferences

            val intent = Intent(this, register::class.java)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
            startActivity(intent)
            finish()
        }

        // Optional: Handle edit icon click to save updated info
        editIcon.setOnClickListener {
            val updatedEmail = emailField.text.toString()
            val updatedPassword = passwordField.text.toString()
            Toast.makeText(this, "Updated Email: $updatedEmail", Toast.LENGTH_SHORT).show()
            // TODO: Send this to server or update local storage
        }
    }
}
