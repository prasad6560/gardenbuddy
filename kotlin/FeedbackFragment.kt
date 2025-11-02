package com.simats.gardenbuddy.ui.feedback

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.simats.gardenbuddy.Api.ApiResponse
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.databinding.FragmentFeedbackBinding
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class FeedbackFragment : Fragment() {

    private var _binding: FragmentFeedbackBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentFeedbackBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        binding.button15.setOnClickListener {
            val overallExperience = getCheckedText(listOf("Excellent", "Good", "Average", "Poor"))
            val userFriendly = getCheckedText(listOf("Yes", "Somewhat", "No"))
            val helpfulFeatures = getCheckedList(listOf("Planting Guides", "Watering and care"))
            val tipsAccuracy = getCheckedText(listOf("Very helpful", "Somewhat helpful", "Not helpful"))
            val recommendationRating = getCheckedText(listOf("1", "2", "3", "4", "5"))
            val feedback = "Great app with accurate tips!" // Optional: can be dynamic with EditText

            if (overallExperience == null || userFriendly == null || tipsAccuracy == null || recommendationRating == null) {
                Toast.makeText(requireContext(), "Please answer all questions", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            val call = RetrofitClient.instance.submitFeedback(
                overallExperience,
                userFriendly,
                helpfulFeatures.joinToString(", "),
                tipsAccuracy,
                recommendationRating.toInt(),

                feedback
            )

            call.enqueue(object : Callback<ApiResponse> {
                override fun onResponse(call: Call<ApiResponse>, response: Response<ApiResponse>) {
                    if (response.isSuccessful && response.body()?.success == true) {
                        Toast.makeText(requireContext(), "Feedback submitted successfully!", Toast.LENGTH_SHORT).show()
                    } else {
                        Toast.makeText(requireContext(), "Error: ${response.body()?.message}", Toast.LENGTH_LONG).show()
                    }
                }

                override fun onFailure(call: Call<ApiResponse>, t: Throwable) {
                    Toast.makeText(requireContext(), "Request failed: ${t.localizedMessage}", Toast.LENGTH_LONG).show()
                }
            })
        }
    }

    private fun getCheckedText(options: List<String>): String? {
        for (option in options) {
            val id = resources.getIdentifier("checkbox_${option.lowercase().replace(" ", "_")}", "id", requireContext().packageName)
            val checkbox = view?.findViewById<CheckBox>(id)
            if (checkbox?.isChecked == true) return option
        }
        return null
    }

    private fun getCheckedList(options: List<String>): List<String> {
        val checkedItems = mutableListOf<String>()
        for (option in options) {
            val id = resources.getIdentifier("checkbox_${option.lowercase().replace(" ", "_")}", "id", requireContext().packageName)
            val checkbox = view?.findViewById<CheckBox>(id)
            if (checkbox?.isChecked == true) checkedItems.add(option)
        }
        return checkedItems
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
