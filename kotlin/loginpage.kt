package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.model.LoginResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class loginpage : AppCompatActivity() {

    private lateinit var btnAdminLogin: Button
    private lateinit var edtEmail: EditText
    private lateinit var edtPass: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_loginpage)

        btnAdminLogin = findViewById(R.id.btnAdminLogin)
        edtEmail = findViewById(R.id.edtEmail)
        edtPass = findViewById(R.id.edtPass)

        btnAdminLogin.setOnClickListener {
            val email = edtEmail.text.toString().trim()
            val password = edtPass.text.toString().trim()

            if (email.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, "Please enter email and password", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            loginUser(email, password)
        }
    }

    private fun loginUser(email: String, password: String) {
        RetrofitClient.instance.login(email, password).enqueue(object : Callback<LoginResponse> {
            override fun onResponse(call: Call<LoginResponse>, response: Response<LoginResponse>) {
                if (response.isSuccessful) {
                    val loginResponse = response.body()
                    if (loginResponse != null && loginResponse.success) {
                        Toast.makeText(this@loginpage, "Login Successful", Toast.LENGTH_SHORT).show()
                        val intent = Intent(this@loginpage, HomeActivity::class.java)
                        startActivity(intent)
                        finish()
                    } else {
                        Toast.makeText(this@loginpage, loginResponse?.message ?: "Login Failed", Toast.LENGTH_SHORT).show()
                    }
                } else {
                    Toast.makeText(this@loginpage, "Server Error: ${response.code()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<LoginResponse>, t: Throwable) {
                Toast.makeText(this@loginpage, "Network Error: ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })
    }
}
