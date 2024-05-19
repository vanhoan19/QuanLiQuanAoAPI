package com.example.quanlyquanao.repository

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.retrofit.RetrofitService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class ProductRepository {
    private val productsCache = MutableLiveData<List<Product>>()
    fun getProducts(): MutableLiveData<List<Product>> {
        if (productsCache.value == null) {
            RetrofitService.instance.listProducts().enqueue(object : Callback<List<Product>?> {
                override fun onResponse(
                    call: Call<List<Product>?>,
                    response: Response<List<Product>?>
                ) {
                    productsCache.postValue(response.body())
                }

                override fun onFailure(call: Call<List<Product>?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }
        return productsCache
    }
}
