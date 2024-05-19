package com.example.quanlyquanao.ui.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.quanlyquanao.R
import com.example.quanlyquanao.adapters.InvoiceAdapter
import com.example.quanlyquanao.databinding.FragmentCustomerHistoryBinding
import com.example.quanlyquanao.models.Invoice
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.variables
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class CustomerHistoryFragment : Fragment(R.layout.fragment_customer_history) {
    lateinit var binding: FragmentCustomerHistoryBinding
    lateinit var myInvoiceAdapter: InvoiceAdapter

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding = FragmentCustomerHistoryBinding.bind(view)

        RetrofitService.instance.getSumByCustomerID(variables.customer.MaKH).enqueue(object : Callback<String?> {
            override fun onResponse(call: Call<String?>, response: Response<String?>) {
                if (response.isSuccessful) {
                    binding.txtTongTien.text = functions.convertStringToCurrency(response.body()!!)
                }
            }

            override fun onFailure(call: Call<String?>, t: Throwable) {
                TODO("Not yet implemented")
            }
        })

        RetrofitService.instance.getInvoicesByCustomerID(variables.customer.MaKH).enqueue(object : Callback<List<Invoice>?> {
            override fun onResponse(
                call: Call<List<Invoice>?>,
                response: Response<List<Invoice>?>
            ) {
                if (response.isSuccessful) {
                    myInvoiceAdapter = InvoiceAdapter(response.body()!!)
                    binding.rvInvoices.adapter = myInvoiceAdapter
                    binding.rvInvoices.layoutManager = LinearLayoutManager(view.context)
                }
            }

            override fun onFailure(call: Call<List<Invoice>?>, t: Throwable) {
                TODO("Not yet implemented")
            }
        })
    }
}