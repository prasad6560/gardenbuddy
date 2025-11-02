package com.simats.gardenbuddy.model

data class LoginResponse(
    val success: Boolean,
    val message: String,
    val username: String? = null,
    val error_code: String? = null
)
