package com.simats.gardenbuddy

import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import com.simats.gardenbuddy.Api.FetchVegetablesResponse
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.databinding.FragmentAdminHomeBinding
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class AdminHomeFragment : Fragment() {

    private var _binding: FragmentAdminHomeBinding? = null
    private val binding get() = _binding!!

    private lateinit var adminAdapter: AdminVegetableAdapter
    private val vegetableList = ArrayList<FetchVegetablesResponse>()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAdminHomeBinding.inflate(inflater, container, false)
        setupRecyclerView()
        fetchVegetables()
        return binding.root
    }

    private fun setupRecyclerView() {
        adminAdapter = AdminVegetableAdapter(vegetableList, ::deleteVegetableDetails)
        binding.recyclerViewAdmin.layoutManager = LinearLayoutManager(requireContext())
        binding.recyclerViewAdmin.adapter = adminAdapter
    }

    private fun fetchVegetables() {
        RetrofitClient.instance.getVegetables().enqueue(object :
            Callback<List<FetchVegetablesResponse>> {
            override fun onResponse(
                call: Call<List<FetchVegetablesResponse>>,
                response: Response<List<FetchVegetablesResponse>>
            ) {
                if (!isAdded) return
                if (response.isSuccessful) {
                    vegetableList.clear()
                    vegetableList.addAll(response.body() ?: emptyList())
                    adminAdapter.notifyDataSetChanged()
                } else {
                    Toast.makeText(requireContext(), "Error: ${response.code()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<List<FetchVegetablesResponse>>, t: Throwable) {
                Log.e("AdminHomeFragment", "API Error: ${t.message}")
                if (isAdded) {
                    Toast.makeText(requireContext(), "Failure: ${t.message}", Toast.LENGTH_SHORT).show()
                }
            }
        })
    }

    private fun deleteVegetableDetails(vegId: Int) {
        RetrofitClient.instance.deleteVegetableDetails(vegId).enqueue(object : Callback<Void> {
            override fun onResponse(call: Call<Void>, response: Response<Void>) {
                if (response.isSuccessful) {
                    Toast.makeText(requireContext(), "Vegetable details deleted", Toast.LENGTH_SHORT).show()
                    // Optionally refresh list
                } else {
                    Toast.makeText(requireContext(), "Delete failed: ${response.code()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<Void>, t: Throwable) {
                Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })
    }


    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
