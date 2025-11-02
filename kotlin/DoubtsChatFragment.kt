package com.simats.gardenbuddy.ui.doubtschat

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.simats.gardenbuddy.Api.ChatMessage
import com.simats.gardenbuddy.Api.Content
import com.simats.gardenbuddy.Api.GeminiClient
import com.simats.gardenbuddy.Api.GeminiRequest
import com.simats.gardenbuddy.Api.GeminiResponse
import com.simats.gardenbuddy.Api.Part
import com.simats.gardenbuddy.R
import com.simats.gardenbuddy.model.*

import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class DoubtsChatFragment : Fragment() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var editText: EditText
    private lateinit var btnSend: Button
    private lateinit var adapter: ChatAdapter
    private val messages = mutableListOf<ChatMessage>()

    private val apiKey = "AIzaSyBmZqRm9LiFe-Ni3y-TxQf2KkIAk629sdw" // Replace with your key

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View {
        val view = inflater.inflate(R.layout.fragment_doubts_chat, container, false)

        recyclerView = view.findViewById(R.id.recyclerView)
        editText = view.findViewById(R.id.editText)
        btnSend = view.findViewById(R.id.btnSend)

        adapter = ChatAdapter(messages)
        recyclerView.layoutManager = LinearLayoutManager(requireContext())
        recyclerView.adapter = adapter

        btnSend.setOnClickListener {
            val userInput = editText.text.toString().trim()
            if (userInput.isNotEmpty()) {
                addMessage(userInput, true)
                editText.text.clear()
                sendToGemini(userInput)
            }
        }

        return view
    }

    private fun addMessage(message: String, isUser: Boolean) {
        messages.add(ChatMessage(message, isUser))
        adapter.notifyItemInserted(messages.size - 1)
        recyclerView.scrollToPosition(messages.size - 1)
    }

    private fun sendToGemini(question: String) {
        val prompt = "Only answer questions about plants. User asked: $question"

        val request = GeminiRequest(
            contents = listOf(Content(parts = listOf(Part(text = prompt))))
        )

        GeminiClient.instance.generateContent(apiKey, request)
            .enqueue(object : Callback<GeminiResponse> {
                override fun onResponse(call: Call<GeminiResponse>, response: Response<GeminiResponse>) {
                    val reply = response.body()
                        ?.candidates?.firstOrNull()
                        ?.content?.parts?.firstOrNull()
                        ?.text ?: "No response"
                    addMessage(reply, false)
                }

                override fun onFailure(call: Call<GeminiResponse>, t: Throwable) {
                    addMessage("Error: ${t.message}", false)
                }
            })
    }
}
