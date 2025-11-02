package com.simats.gardenbuddy

import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide

class YouTubeAdapter(private val videos: List<YouTubeVideo>) :
    RecyclerView.Adapter<YouTubeAdapter.VideoViewHolder>() {

    inner class VideoViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val thumbnail: ImageView = view.findViewById(R.id.thumbnail)
        val title: TextView = view.findViewById(R.id.title)

        init {
            view.setOnClickListener {
                val video = videos[adapterPosition]
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(video.url))
                it.context.startActivity(intent)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VideoViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_video, parent, false)
        return VideoViewHolder(view)
    }

    override fun onBindViewHolder(holder: VideoViewHolder, position: Int) {
        val video = videos[position]
        holder.title.text = video.title

        val videoId = video.url.substringAfter("youtu.be/").substringBefore("?")
        val thumbnailUrl = "https://img.youtube.com/vi/$videoId/0.jpg"

        Glide.with(holder.itemView.context)
            .load(thumbnailUrl)
            .placeholder(android.R.drawable.ic_media_play)
            .into(holder.thumbnail)
    }


    override fun getItemCount(): Int = videos.size
}
