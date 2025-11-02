package com.simats.gardenbuddy.response

data class VegetableDetailResponse(
    val success: Boolean,
    val message: String,
    val data: VegetableDetail
)

data class VegetableDetail(
    val id: Int,
    val vegetable_id: Int,
    val name: String,
    val container_image: String,
    val soil_image: String,
    val planting_image: String,
    val container_liters: String,
    val typeofsoil: String,
    val soil_preparation: String,
    val planting: String,
    val watering_schedule: String,
    val nutrients_for_soil: String,
    val disease: String,
    val harvest_time: String,
    val benefits: String
)
