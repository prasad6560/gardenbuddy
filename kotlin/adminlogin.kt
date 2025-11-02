package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.model.LoginResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class adminlogin : AppCompatActivity() {

    private lateinit var edtEmail: EditText
    private lateinit var edtPass: EditText
    private lateinit var btnLogin: AppCompatButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_adminlogin)

        edtEmail = findViewById(R.id.edtEmail)
        edtPass = findViewById(R.id.edtPass)
        btnLogin = findViewById(R.id.btnAdminLogin)

        btnLogin.setOnClickListener {
            val email = edtEmail.text.toString().trim()
            val password = edtPass.text.toString().trim()

            if (email.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, "Please enter both email and password", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            loginAdmin(email, password)
        }
    }

    private fun loginAdmin(email: String, password: String) {
        RetrofitClient.instance.loginAdmin(email, password)
            .enqueue(object : Callback<LoginResponse> {
                override fun onResponse(call: Call<LoginResponse>, response: Response<LoginResponse>) {
                    val body = response.body()
                    if (response.isSuccessful && body != null) {
                        if (body.success) {
                            Toast.makeText(this@adminlogin, "Welcome ${body.username}", Toast.LENGTH_SHORT).show()
                            startActivity(Intent(this@adminlogin, AdminDashboardActivity::class.java))
                            finish()
                        } else {
                            Toast.makeText(this@adminlogin, body.message, Toast.LENGTH_SHORT).show()
                        }
                    } else {
                        Toast.makeText(this@adminlogin, "Login failed. Try again.", Toast.LENGTH_SHORT).show()
                    }
                }

                override fun onFailure(call: Call<LoginResponse>, t: Throwable) {
                    Toast.makeText(this@adminlogin, "Network error: ${t.message}", Toast.LENGTH_SHORT).show()
                }
            })
    }
}
