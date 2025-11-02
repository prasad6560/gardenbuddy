// RegisterRequest.kt
data class RegisterRequest(
    val name: String,
    val email: String,
    val password: String
)

// RegisterResponse.kt
data class RegisterResponse(
    val success: Boolean,
    val message: String,
    val data: User?
)

// User.kt
data class User(
    val id: Int,
    val name: String,
    val email: String
)
