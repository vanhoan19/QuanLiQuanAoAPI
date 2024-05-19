package com.example.quanlyquanao.ui.viewModelFacroties

import android.app.Application
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.quanlyquanao.repository.CustomerRepository
import com.example.quanlyquanao.repository.ProductRepository
import com.example.quanlyquanao.ui.viewModels.CustomerViewModel
import com.example.quanlyquanao.ui.viewModels.ProductViewModel

class CustomerViewModelFactory(val app: Application,  private val repository: CustomerRepository): ViewModelProvider.Factory {
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(CustomerViewModel::class.java)) {
            @Suppress("UNCHECKED_CAST")
            return CustomerViewModel(app, repository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}