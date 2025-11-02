package com.simats.gardenbuddy

import android.content.Intent
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton
import com.bumptech.glide.Glide
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.response.VegetableDetailResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class vegtomatodetails : AppCompatActivity() {


    var harvestTime: String? = null
    var plantBenefits: String? = null
    var containerLiters: String? = null
    var containerImage: String? = null
    var soilType: String? = null
    var soilPreparation: String? = null
    var planting: String? = null
    var plantingImage: String? = null
    var watering: String? = null
    var nutrient: String? = null
    var disease: String? = null


    lateinit var time: TextView
    lateinit var benefits: TextView

    lateinit var tomato: AppCompatButton
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_vegtomatodetails)

        val image = findViewById<ImageView>(R.id.imageView7)
        time = findViewById<TextView>(R.id.textView4)
        benefits = findViewById<TextView>(R.id.textView9)



        val vegName = intent.getStringExtra("VEG_NAME")
        val vegId = intent.getStringExtra("VEG_ID")
        val vegImage = intent.getStringExtra("VEG_IMAGE")

        fetchVegetableDetails(vegId)


        Glide.with(this)
            .load(vegImage)
            .placeholder(R.drawable.pots)
            .into(image)

        tomato = findViewById(R.id.button10)
        tomato.setOnClickListener {
            val tomato2 = Intent(this, tomatopage1::class.java)

            tomato2.putExtra("CONTAINER_LITERS", containerLiters)
            tomato2.putExtra("CONTAINER_IMAGE", containerImage)
            tomato2.putExtra("SOIL_TYPE", soilType)
            tomato2.putExtra("SOIL_PREPARATION", soilPreparation)

            startActivity(tomato2)
        }
        tomato = findViewById(R.id.button11)
        tomato.setOnClickListener {

            val tomato2 = Intent(this, tomatodetails2::class.java)
           tomato2.putExtra("PLANTING", planting)
            tomato2.putExtra("PLANTING_IMAGE", plantingImage)
            tomato2.putExtra("WATERING", watering)
            startActivity(tomato2)
        }
        tomato = findViewById(R.id.button12)
        tomato.setOnClickListener {
            val tomato2 = Intent(this, tomatopage3::class.java)
            startActivity(tomato2)
            tomato2.putExtra("NUTRIENT", nutrient)
            tomato2.putExtra("DISEASE", disease)
            startActivity(tomato2)

        }
    }

    private fun fetchVegetableDetails(vegId: String?) {
        RetrofitClient.instance.getVegetableDetails(vegId)
            .enqueue(object : Callback<VegetableDetailResponse> {
                override fun onResponse(
                    call: Call<VegetableDetailResponse>,
                    response: Response<VegetableDetailResponse>
                ) {
                    if (response.isSuccessful && response.body()?.success == true) {
                        val veg = response.body()!!.data

                        harvestTime = veg.harvest_time
                        plantBenefits = "Benefits: "+veg.benefits
                        time.text = harvestTime

                        containerLiters = veg.container_liters
                        containerImage = veg.container_image
                        soilType = veg.typeofsoil
                        soilPreparation = veg.nutrients_for_soil
                        planting = veg.planting
                        plantingImage = veg.planting_image
                        watering = veg.watering_schedule
                        nutrient = veg.nutrients_for_soil
                        disease = veg.disease

                    } else {
                        Toast.makeText(this@vegtomatodetails, "Failed to fetch details", Toast.LENGTH_SHORT).show()
                    }
                }

                override fun onFailure(call: Call<VegetableDetailResponse>, t: Throwable) {
                    Toast.makeText(this@vegtomatodetails, "Error: ${t.message}", Toast.LENGTH_LONG).show()
                }
            })
    }
}