package com.simats.gardenbuddy.Api

data class FeedbackResponse(
    val success: Boolean,
    val message: String,
    val data: FeedbackData? = null
)

data class FeedbackData(
    val id: Int,
    val register_id: Int,
    val overall_experience: String,
    val user_friendly: String,
    val helpful_features: List<String>,
    val tips_accuracy: String,
    val recommendation_rating: Int
)
