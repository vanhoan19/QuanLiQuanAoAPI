package com.example.quanlyquanao.repository

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.retrofit.RetrofitService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CustomerRepository {
    private val customersCache = MutableLiveData<List<Customer>>()
    private val responseUpdate = MutableLiveData<Map<String, String>>()
    fun getCustomers(): LiveData<List<Customer>> {
        if (customersCache.value == null) {
            RetrofitService.instance.listCustomers().enqueue(object : Callback<MutableList<Customer>?> {
                override fun onResponse(
                    call: Call<MutableList<Customer>?>,
                    response: Response<MutableList<Customer>?>
                ) {
                    customersCache.postValue(response.body())
                }

                override fun onFailure(call: Call<MutableList<Customer>?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }
        return customersCache
    }

    fun updateCustomer(MaKH: Int, TenKH: String, SDT: String, DiaChi: String): LiveData<Map<String, String>>{
        if (responseUpdate.value == null) {
            RetrofitService.instance.updateCustomer(MaKH, TenKH, SDT, DiaChi).enqueue(object : Callback<Map<String, String>?> {
                override fun onResponse(
                    call: Call<Map<String, String>?>,
                    response: Response<Map<String, String>?>
                ) {
                    responseUpdate.postValue(response.body())
                    Log.d("TAG", response.body().toString())
                }

                override fun onFailure(call: Call<Map<String, String>?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }
        return responseUpdate
    }
}
