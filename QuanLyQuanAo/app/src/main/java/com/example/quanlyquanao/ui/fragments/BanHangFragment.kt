package com.example.quanlyquanao.ui.fragments

import android.app.Activity
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.quanlyquanao.R
import com.example.quanlyquanao.adapters.SanPhamAdapter
import com.example.quanlyquanao.databinding.FragmentBanHangBinding
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.repository.ProductRepository
import com.example.quanlyquanao.ui.CustomerDetailActivity
import com.example.quanlyquanao.ui.HoaDonActivity
import com.example.quanlyquanao.ui.KhachHangActivity
import com.example.quanlyquanao.ui.MainActivity
import com.example.quanlyquanao.ui.viewModels.ProductViewModel
import com.example.quanlyquanao.ui.viewModelFacroties.ProductViewModelFactory
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.functions.Companion.filterProducts
import com.example.quanlyquanao.utils.functions.Companion.updateCustomer
import com.example.quanlyquanao.utils.functions.Companion.updateRecyclerView
import com.example.quanlyquanao.utils.variables
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch


class BanHangFragment : Fragment(R.layout.fragment_ban_hang) {
    private lateinit var viewModel: ProductViewModel
    private lateinit var myAdapter: SanPhamAdapter
    lateinit var binding: FragmentBanHangBinding
    private val searchDelayMillis = 1000L // 1 giây
    private var searchJob: Job? = null
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding = FragmentBanHangBinding.bind(view)

        val factory = ProductViewModelFactory(ProductRepository())

        viewModel = ViewModelProvider(this, factory).get(ProductViewModel::class.java)

        viewModel.products.observe(viewLifecycleOwner, Observer {products ->
            myAdapter = SanPhamAdapter(products)
            myAdapter.onItemClick = {
                val intent = Intent(activity, HoaDonActivity::class.java)
                intent.putExtra("product", it)
                startActivity(intent)
            }
            binding.apply {
                txtKhachHang.text = variables.customer.TenKH
                khachHang.setOnClickListener {
                    openCustomerDetailActivity()
                }
                rvSanPham.apply {
                    adapter = myAdapter
                    layoutManager = LinearLayoutManager(activity)
                }
                edtSearch.addTextChangedListener(object : TextWatcher {
                    override fun afterTextChanged(s: Editable?) {
                        searchJob?.cancel()
                        searchJob = CoroutineScope(Dispatchers.Main).launch {
                            delay(searchDelayMillis)
                            val words = binding.edtSearch.text.toString().lowercase().trim().split(" ")
                            updateRecyclerView(myAdapter, filterProducts(
                                    products,
                                    words
                                )
                            )
                        }
                    }
                    override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
                    override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
                })
            }
        })
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private val searchCustomerResultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        binding.txtKhachHang.text = variables.customer.TenKH
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    fun openCustomerDetailActivity() {
        val intent = Intent(activity, KhachHangActivity::class.java)
        searchCustomerResultLauncher.launch(intent)
    }
}