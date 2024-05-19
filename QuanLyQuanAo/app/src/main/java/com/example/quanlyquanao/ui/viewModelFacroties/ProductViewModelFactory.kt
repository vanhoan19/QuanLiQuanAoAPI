package com.example.quanlyquanao.ui.viewModelFacroties

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.quanlyquanao.repository.ProductRepository
import com.example.quanlyquanao.ui.viewModels.ProductViewModel

class ProductViewModelFactory(private val repository: ProductRepository): ViewModelProvider.Factory {
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(ProductViewModel::class.java)) {
            @Suppress("UNCHECKED_CAST")
            return ProductViewModel(repository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}