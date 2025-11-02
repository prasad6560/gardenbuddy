package com.simats.gardenbuddy.Api

data class VegetableDetailsResponse(
    val success: Boolean,
    val message: String,
    val data: VegetableDetails
)

data class VegetableDetails(
    val id: Int,
    val vegetable_id: Int,
    val container_image: String,
    val soil_image: String,
    val planting_image: String,
    val name: String,
    val container_liters: String,
    val typeofsoil: String,
    val planting: String,
    val watering_schedule: String,
    val nutrients_for_soil: String,
    val disease: String,
    val harvest_time: String,
    val benefits: String
)
