package com.example.quanlyquanao.ui.viewModels

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.repository.ProductRepository

class ProductViewModel(private val repository: ProductRepository) : ViewModel() {
    val products: MutableLiveData<List<Product>> =  repository.getProducts()
}