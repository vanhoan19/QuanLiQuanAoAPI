package com.example.quanlyquanao.ui.fragments

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.Observer
import com.example.quanlyquanao.R
import com.example.quanlyquanao.databinding.FragmentCustomerInfoBinding
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.retrofit.QLQuanAoApi
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.ui.CustomerDetailActivity
import com.example.quanlyquanao.ui.KhachHangActivity
import com.example.quanlyquanao.ui.viewModels.CustomerViewModel
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.variables
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CustomerInfoFragment: Fragment(R.layout.fragment_customer_info) {
    lateinit var binding: FragmentCustomerInfoBinding
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding = FragmentCustomerInfoBinding.bind(view)

        var curCustomer = variables.customer

        binding.txtMaKH.text = curCustomer.MaKH.toString()
        binding.edtTenKH.setText(curCustomer.TenKH)
        binding.edtSDT.setText(curCustomer.SDT)
        binding.edtDiaChi.setText(curCustomer.DiaChi)

        binding.btnSave.setOnClickListener {
            val customer = Customer(
                binding.edtDiaChi.text.toString(),
                variables.customer.MaKH,
                variables.curEmployee!!.MaNV,
                binding.edtSDT.text.toString(),
                binding.edtTenKH.text.toString())
            RetrofitService.instance.updateCustomer(customer).enqueue(object : Callback<Map<String, String>?> {
                override fun onResponse(
                    call: Call<Map<String, String>?>,
                    response: Response<Map<String, String>?>
                ) {
                    if (response.isSuccessful) {
                        functions.print(view.context, "Thông tin khách hàng được cập nhật")
                        variables.customer = customer
                    }
                }

                override fun onFailure(call: Call<Map<String, String>?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }
    }
}