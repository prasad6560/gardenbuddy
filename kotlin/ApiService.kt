package com.simats.gardenbuddy.Api

import com.simats.gardenbuddy.RegisterResponse
import com.simats.gardenbuddy.YouTubeVideo
import com.simats.gardenbuddy.model.LoginResponse
import com.simats.gardenbuddy.response.VegetableDetailResponse

import okhttp3.MultipartBody
import okhttp3.RequestBody
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.Multipart
import retrofit2.http.POST
import retrofit2.http.Query
import retrofit2.http.Part

interface ApiService {

    @FormUrlEncoded
    @POST("login.php")
    fun login(
        @Field("email") email: String,
        @Field("password") password: String
    ): Call<LoginResponse>

    @GET("fetchvegetables.php")
    fun getVegetables(): Call<List<FetchVegetablesResponse>>

    @GET("fetchvegetabledetails.php")
    fun getVegetableDetails(
        @Query("vegetable_id") vegetableId: String?
    ): Call<VegetableDetailResponse>

    @GET("get_youtube.php")
    fun getVideos(): Call<List<YouTubeVideo>>

    @Multipart
    @POST("vegetabledetails.php")
    fun uploadVegetableDetails(
        @Part("name") name: RequestBody,
        @Part("container_liters") containerLiters: RequestBody,
        @Part("typeofsoil") typeofsoil: RequestBody,
        @Part("soil_preparation") soilPreparation: RequestBody,
        @Part("planting") planting: RequestBody,
        @Part("watering_schedule") wateringSchedule: RequestBody,
        @Part("nutrients_for_soil") nutrientsForSoil: RequestBody,
        @Part("disease") disease: RequestBody,
        @Part("harvest_time") harvestTime: RequestBody,
        @Part("benefits") benefits: RequestBody,
        @Part containerImage: MultipartBody.Part?,
        @Part soilImage: MultipartBody.Part?,
        @Part plantingImage: MultipartBody.Part?
    ): Call<ApiResponse>

    @FormUrlEncoded
    @POST("delete_vegetable_details.php")
    fun deleteVegetableDetails(@Field("vegetable_id") vegetableId: Int): Call<Void>

    // Add registerUser inside the interface
    @FormUrlEncoded
    @POST("register.php") // Change this to your actual register endpoint path
    fun registerUser(
        @Field("name") name: String,
        @Field("email") email: String,
        @Field("password") password: String
    ): Call<RegisterResponse>


    @FormUrlEncoded
    @POST("login.php")
    fun loginAdmin(
        @Field("email") email: String,
        @Field("password") password: String
    ): Call<LoginResponse>

    @FormUrlEncoded
    @POST("feedback.php")
    fun submitFeedback(
        @Field("overall_experience") overallExperience: String,
        @Field("user_friendly") userFriendly: String,
        @Field("helpful_features") helpfulFeatures: String,
        @Field("tips_accuracy") tipsAccuracy: String,
        @Field("recommendation_rating") recommendationRating: Int,
        @Field("feedback") feedback: String
    ): Call<ApiResponse>
}
