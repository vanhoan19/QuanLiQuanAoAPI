package com.example.quanlyquanao.ui

import android.annotation.SuppressLint
import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.RequiresApi
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.quanlyquanao.R
import com.example.quanlyquanao.adapters.KhachHangAdapter
import com.example.quanlyquanao.databinding.ActivityKhachHangBinding
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.repository.CustomerRepository
import com.example.quanlyquanao.repository.ProductRepository
import com.example.quanlyquanao.retrofit.QLQuanAoApi
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.ui.viewModelFacroties.CustomerViewModelFactory
import com.example.quanlyquanao.ui.viewModelFacroties.ProductViewModelFactory
import com.example.quanlyquanao.ui.viewModels.CustomerViewModel
import com.example.quanlyquanao.ui.viewModels.ProductViewModel
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.variables
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class KhachHangActivity : AppCompatActivity() {
    private lateinit var myAdapter: KhachHangAdapter
    private lateinit var binding: ActivityKhachHangBinding
    lateinit var customers: MutableList<Customer>

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityKhachHangBinding.inflate(layoutInflater)

        setContentView(binding.root)
        binding.apply {
            btnBack.setOnClickListener {
                finish()
            }
            btnAddCustomer.setOnClickListener {
                showDialogInsertCustomer()
            }
        }
        RetrofitService.instance.listCustomers().enqueue(object : Callback<MutableList<Customer>?> {
            @SuppressLint("NotifyDataSetChanged")
            override fun onResponse(
                call: Call<MutableList<Customer>?>,
                response: Response<MutableList<Customer>?>
            ) {
                if (response.isSuccessful) {
                    customers = response.body()!!
                    myAdapter = KhachHangAdapter(customers)
                    binding.rvKhachHang.apply {
                        adapter = myAdapter
                        layoutManager = LinearLayoutManager(this@KhachHangActivity)
                    }
                    myAdapter.onItemClick = {customer ->
                        variables.customer = customer
                        finish()
                    }
                    myAdapter.onItemDetail = { customer ->
                        variables.customer = customer
                        openCustomerDetailActivity()
                    }

                }
            }

            override fun onFailure(call: Call<MutableList<Customer>?>, t: Throwable) {
                TODO("Not yet implemented")
            }
        })
    }

    private fun showDialogInsertCustomer() {
        val alertDialog = AlertDialog.Builder(this)
        alertDialog.setTitle("Thêm mới khách hàng")
        alertDialog.setMessage("Vui lòng nhập thông tin người dùng")

        val dialogView = layoutInflater.inflate(R.layout.dialog_insert_customer, null)
        alertDialog.setView(dialogView)

        val edtName: EditText = dialogView.findViewById(R.id.edtTenKH)
        val edtSDT: EditText = dialogView.findViewById(R.id.edtSDT)
        val edtDiaChi: EditText = dialogView.findViewById(R.id.edtDiaChi)

        alertDialog.setPositiveButton("Thêm mới") { dialog, _ ->
            val name = edtName.text.toString()
            val sdt = edtSDT.text.toString()
            val diaChi = edtDiaChi.text.toString()
            val customer = Customer(diaChi,13, variables.customer.MaNV, sdt, name)
            RetrofitService.instance.insertCustomer(customer).enqueue(object : Callback<Map<String, String>?> {
                @SuppressLint("NotifyDataSetChanged")
                override fun onResponse(
                    call: Call<Map<String, String>?>,
                    response: Response<Map<String, String>?>
                ) {
                    if (response.isSuccessful) {
                        functions.print(this@KhachHangActivity, "Thêm mới thành công!")
                        customers.add(customer)
                        myAdapter.notifyDataSetChanged()
                    }
                }

                override fun onFailure(call: Call<Map<String, String>?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }

        alertDialog.setNegativeButton("Hủy") { dialog, _ ->
            dialog.cancel()
        }

        functions.print(this@KhachHangActivity, variables.curEmployee?.MaNV.toString())
        alertDialog.show()
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private val updateCustomerResultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val position = customers.indexOfFirst { it.MaKH == variables.customer.MaKH }
            customers[position] = variables.customer
            myAdapter.notifyItemChanged(position)
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    fun openCustomerDetailActivity() {
        val intent = Intent(this, CustomerDetailActivity::class.java)
        updateCustomerResultLauncher.launch(intent)
    }
}