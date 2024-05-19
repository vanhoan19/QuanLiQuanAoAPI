package com.example.quanlyquanao.retrofit

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitService {
    private const val BASE_URL = "http://192.168.1.13:1919"

    private fun retrofitService(): Retrofit {
        return Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }
    val instance: QLQuanAoApi by lazy {
        retrofitService().create(QLQuanAoApi::class.java)
    }
}