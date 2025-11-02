package com.simats.gardenbuddy

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.simats.gardenbuddy.Api.RetrofitClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class YouTubeActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var adapter: YouTubeAdapter
    private val videoList = mutableListOf<YouTubeVideo>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_youtube)

        recyclerView = findViewById(R.id.youtubeRecyclerView)
        recyclerView.layoutManager = LinearLayoutManager(this)

        adapter = YouTubeAdapter(videoList)
        recyclerView.adapter = adapter

        loadVideos()
    }

    private fun loadVideos() {
        RetrofitClient.instance.getVideos().enqueue(object : Callback<List<YouTubeVideo>> {
            override fun onResponse(
                call: Call<List<YouTubeVideo>>,
                response: Response<List<YouTubeVideo>>
            ) {
                if (response.isSuccessful && response.body() != null) {
                    videoList.clear()
                    videoList.addAll(response.body()!!)
                    adapter.notifyDataSetChanged()
                } else {
                    val error = response.errorBody()?.string()

                    Toast.makeText(this@YouTubeActivity, "Failed to load videos", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<List<YouTubeVideo>>, t: Throwable) {
                Toast.makeText(this@YouTubeActivity, "Error: ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })
    }
}
