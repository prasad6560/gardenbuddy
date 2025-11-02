package com.simats.gardenbuddy.ui.tips

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import com.simats.gardenbuddy.*

class TipsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val v = inflater.inflate(R.layout.fragment_tips, container, false)

        // 1. Pot Orchard
        val potOrchardLayout = v.findViewById<LinearLayout>(R.id.lin)
        potOrchardLayout.setOnClickListener {
            val intent = Intent(requireContext(), potorchard::class.java)
            startActivity(intent)
        }

        // 2. Compost
        val compostLayout = v.findViewById<LinearLayout>(R.id.linearLayout3)
        compostLayout.setOnClickListener {
            val intent = Intent(requireContext(), compost::class.java)
            startActivity(intent)
        }

        // 3. Vermicomposting
        val vermiLayout = v.findViewById<LinearLayout>(R.id.linearLayout4)
        vermiLayout.setOnClickListener {
            val intent = Intent(requireContext(), vermicomposting::class.java)
            startActivity(intent)
        }

        // 4. Organic Remedies
        val organicLayout = v.findViewById<LinearLayout>(R.id.linearLayout5)
        organicLayout.setOnClickListener {
            val intent = Intent(requireContext(), organicremedies::class.java)
            startActivity(intent)
        }

        // 5. Plagues and Diseases
        val plagueLayout = v.findViewById<LinearLayout>(R.id.linearLayout2)
        plagueLayout.setOnClickListener {
            val intent = Intent(requireContext(), plaguesanddiseases::class.java)
            startActivity(intent)
        }

        val btn_youtube = v.findViewById<Button>(R.id.btn_youtube)
        btn_youtube.setOnClickListener {
            val intent = Intent(requireContext(), YouTubeActivity::class.java)
            startActivity(intent)
        }

        return v
    }
}
