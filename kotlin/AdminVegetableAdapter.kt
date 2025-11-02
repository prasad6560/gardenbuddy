package com.simats.gardenbuddy

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.simats.gardenbuddy.Api.FetchVegetablesResponse
import com.simats.gardenbuddy.Api.RetrofitClient.IMAGE_PATH
import com.simats.gardenbuddy.databinding.ItemAdminVegetableBinding

class AdminVegetableAdapter(
    private val items: List<FetchVegetablesResponse>,
    private val onDeleteClicked: (Int) -> Unit
) : RecyclerView.Adapter<AdminVegetableAdapter.VegViewHolder>() {

    inner class VegViewHolder(val binding: ItemAdminVegetableBinding) :
        RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VegViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        val binding = ItemAdminVegetableBinding.inflate(inflater, parent, false)
        return VegViewHolder(binding)
    }

    override fun onBindViewHolder(holder: VegViewHolder, position: Int) {
        val veg = items[position]
        holder.binding.vegName.text = veg.name
        holder.binding.vegPrice.text = "₹${veg.price}"
        val imageUrl = IMAGE_PATH + veg.image_path

        Glide.with(holder.itemView.context)
            .load(imageUrl)
            .placeholder(R.drawable.pots)
            .into(holder.binding.imageView)

        holder.binding.btnDelete.setOnClickListener {
            onDeleteClicked(veg.id)
        }
    }

    override fun getItemCount(): Int = items.size
}
