package com.example.quanlyquanao.ui.viewModels

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.repository.CustomerRepository

class CustomerViewModel(app: Application, private val repository: CustomerRepository) : AndroidViewModel(app) {
    val customers: LiveData<List<Customer>> =  repository.getCustomers()
    fun responseUpdate(MaKH: Int, TenKH: String, SDT: String, DiaChi: String): LiveData<Map<String, String>>
        = repository.updateCustomer(MaKH, TenKH, SDT, DiaChi)
}