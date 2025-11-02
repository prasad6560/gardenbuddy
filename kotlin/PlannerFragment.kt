package com.simats.gardenbuddy.ui.planner

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import com.simats.gardenbuddy.Api.FetchVegetablesResponse
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.databinding.FragmentPlannerBinding
import com.simats.gardenbuddy.userprofile
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class PlannerFragment : Fragment() {

    private lateinit var binding: FragmentPlannerBinding
    private lateinit var plannerAdapter: PlannerAdapter
    private var vegetableList = ArrayList<FetchVegetablesResponse>()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentPlannerBinding.inflate(inflater, container, false)

        setupRecyclerView()
        fetchVegetables()

        binding.userProfile.setOnClickListener {
            startActivity(Intent(requireContext(), userprofile::class.java))
        }

        return binding.root
    }

    private fun setupRecyclerView() {
        vegetableList = ArrayList()
        plannerAdapter = PlannerAdapter(vegetableList, requireActivity())
        binding.vegetableitemsRV.layoutManager = LinearLayoutManager(requireContext())
        binding.vegetableitemsRV.adapter = plannerAdapter
    }

    private fun fetchVegetables() {
        RetrofitClient.instance.getVegetables().enqueue(object : Callback<List<FetchVegetablesResponse>> {
            @SuppressLint("NotifyDataSetChanged")
            override fun onResponse(
                call: Call<List<FetchVegetablesResponse>>,
                response: Response<List<FetchVegetablesResponse>>
            ) {
                if (!isAdded) return // prevent crash if fragment is detached

                if (response.isSuccessful) {
                    vegetableList.clear()
                    response.body()?.let {
                        vegetableList.addAll(it)
                    }
                    plannerAdapter.notifyDataSetChanged()
                } else {
                    Toast.makeText(requireContext(), "Error: ${response.code()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<List<FetchVegetablesResponse>>, t: Throwable) {
                Log.e("PlannerFragment", "API Error: ${t.message}")
                if (isAdded) {
                    Toast.makeText(requireContext(), "API Failure: ${t.message}", Toast.LENGTH_SHORT).show()
                }
            }
        })
    }
}
