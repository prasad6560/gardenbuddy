package com.simats.gardenbuddy

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.view.*
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import com.simats.gardenbuddy.Api.RetrofitClient
import com.simats.gardenbuddy.databinding.FragmentAdminAddVegBinding
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.RequestBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.File
import com.simats.gardenbuddy.Api.ApiResponse

class AdminAddVegFragment : Fragment() {

    private var _binding: FragmentAdminAddVegBinding? = null
    private val binding get() = _binding!!

    private var uriContainer: Uri? = null
    private var uriSoil: Uri? = null
    private var uriPlanting: Uri? = null

    companion object {
        const val PICK_CONTAINER = 1
        const val PICK_SOIL = 2
        const val PICK_PLANTING = 3
        const val STORAGE_PERMISSION_CODE = 1001
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAdminAddVegBinding.inflate(inflater, container, false)

        binding.btnPickContainerImage.setOnClickListener {
            if (hasStoragePermission()) {
                pickImage(PICK_CONTAINER)
            } else {
                requestStoragePermission()
            }
        }

        binding.btnPickSoilImage.setOnClickListener {
            if (hasStoragePermission()) {
                pickImage(PICK_SOIL)
            } else {
                requestStoragePermission()
            }
        }

        binding.btnPickPlantingImage.setOnClickListener {
            if (hasStoragePermission()) {
                pickImage(PICK_PLANTING)
            } else {
                requestStoragePermission()
            }
        }

        binding.btnSubmit.setOnClickListener {
            uploadData()
        }

        return binding.root
    }

    private fun pickImage(requestCode: Int) {
        val intent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
        startActivityForResult(intent, requestCode)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK && data != null) {
            when (requestCode) {
                PICK_CONTAINER -> {
                    uriContainer = data.data
                    binding.imgContainer.setImageURI(uriContainer)
                }
                PICK_SOIL -> {
                    uriSoil = data.data
                    binding.imgSoil.setImageURI(uriSoil)
                }
                PICK_PLANTING -> {
                    uriPlanting = data.data
                    binding.imgPlanting.setImageURI(uriPlanting)
                }
            }
        }
    }

    private fun uploadData() {
        val name = binding.etName.text.toString()
        val map = mapOf(
            "name" to name,
            "container_liters" to binding.etContainerLiters.text.toString(),
            "typeofsoil" to binding.etTypeOfSoil.text.toString(),
            "soil_preparation" to binding.etSoilPreparation.text.toString(),
            "planting" to binding.etPlanting.text.toString(),
            "watering_schedule" to binding.etWateringSchedule.text.toString(),
            "nutrients_for_soil" to binding.etNutrients.text.toString(),
            "disease" to binding.etDisease.text.toString(),
            "harvest_time" to binding.etHarvestTime.text.toString(),
            "benefits" to binding.etBenefits.text.toString()
        )

        val partMap = map.mapValues {
            RequestBody.create("text/plain".toMediaTypeOrNull(), it.value)
        }

        val containerPart = makeImagePart(uriContainer, "container_image")
        val soilPart = makeImagePart(uriSoil, "soil_image")
        val plantingPart = makeImagePart(uriPlanting, "planting_image")

        RetrofitClient.instance.uploadVegetableDetails(
            partMap["name"]!!,
            partMap["container_liters"]!!,
            partMap["typeofsoil"]!!,
            partMap["soil_preparation"]!!,
            partMap["planting"]!!,
            partMap["watering_schedule"]!!,
            partMap["nutrients_for_soil"]!!,
            partMap["disease"]!!,
            partMap["harvest_time"]!!,
            partMap["benefits"]!!,
            containerPart,
            soilPart,
            plantingPart
        ).enqueue(object : Callback<ApiResponse> {
            override fun onResponse(call: Call<ApiResponse>, response: Response<ApiResponse>) {
                if (response.isSuccessful){
                    Toast.makeText(requireContext(), response.body()?.message +"", Toast.LENGTH_SHORT).show()

                } else {
                    val error = response.errorBody()?.string()
                    Toast.makeText(requireContext(),error +"", Toast.LENGTH_SHORT).show()

                }
            }

            override fun onFailure(call: Call<ApiResponse>, t: Throwable) {
                Toast.makeText(requireContext(), "Error: ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })
    }

    private fun makeImagePart(uri: Uri?, name: String): MultipartBody.Part? {
        uri ?: return null
        val file = File(getRealPathFromURI(uri))
        val req = RequestBody.create("image/*".toMediaTypeOrNull(), file)
        return MultipartBody.Part.createFormData(name, file.name, req)
    }

    private fun getRealPathFromURI(uri: Uri): String {
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor = requireActivity().contentResolver.query(uri, projection, null, null, null)
        val columnIndex = cursor?.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
        cursor?.moveToFirst()
        val path = cursor?.getString(columnIndex ?: 0) ?: ""
        cursor?.close()
        return path
    }

    private fun hasStoragePermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            ContextCompat.checkSelfPermission(requireContext(), Manifest.permission.READ_MEDIA_IMAGES) == PackageManager.PERMISSION_GRANTED
        } else {
            ContextCompat.checkSelfPermission(requireContext(), Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED
        }
    }

    private fun requestStoragePermission() {
        val permissions = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            arrayOf(Manifest.permission.READ_MEDIA_IMAGES)
        } else {
            arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE)
        }
        ActivityCompat.requestPermissions(requireActivity(), permissions, STORAGE_PERMISSION_CODE)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (requestCode == STORAGE_PERMISSION_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(requireContext(), "Storage permission granted", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(requireContext(), "Permission denied", Toast.LENGTH_SHORT).show()
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
