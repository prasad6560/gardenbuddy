package com.simats.gardenbuddy.ui.planner

import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.FragmentActivity
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.simats.gardenbuddy.Api.FetchVegetablesResponse
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.R
import com.simats.gardenbuddy.vegtomatodetails

class PlannerAdapter(
    private val vegetableList: List<FetchVegetablesResponse>,
    val activity: FragmentActivity
) :
    RecyclerView.Adapter<PlannerAdapter.PlannerViewHolder>() {

    class PlannerViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val name: TextView = itemView.findViewById(R.id.vegetable_name)
        val image: ImageView = itemView.findViewById(R.id.vegetable_image)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PlannerViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.rv_vegetable_layout, parent, false)
        return PlannerViewHolder(view)
    }

    override fun onBindViewHolder(holder: PlannerViewHolder, position: Int) {
        val vegetable = vegetableList[position]
        holder.name.text = vegetable.name

        val imageUrl = RetrofitClient.IMAGE_PATH + vegetable.image_path

        Glide.with(activity).load(imageUrl)
            .placeholder(R.drawable.pots)
            .into(holder.image)

        // Handle item click
        holder.itemView.setOnClickListener {
            val intent = Intent(activity, vegtomatodetails::class.java)
            intent.putExtra("VEG_ID", ""+vegetable.id)
            intent.putExtra("VEG_NAME", vegetable.name)
            intent.putExtra("VEG_IMAGE", imageUrl)
            activity.startActivity(intent)
        }

    }

    override fun getItemCount(): Int = vegetableList.size
}
