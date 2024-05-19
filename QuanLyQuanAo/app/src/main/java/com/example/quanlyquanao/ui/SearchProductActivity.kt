package com.example.quanlyquanao.ui

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.quanlyquanao.adapters.SanPhamAdapter
import com.example.quanlyquanao.databinding.ActivitySearchProductBinding
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.repository.ProductRepository
import com.example.quanlyquanao.ui.viewModelFacroties.ProductViewModelFactory
import com.example.quanlyquanao.ui.viewModels.ProductViewModel
import com.example.quanlyquanao.utils.functions.Companion.filterProducts
import com.example.quanlyquanao.utils.functions.Companion.updateRecyclerView
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class SearchProductActivity : AppCompatActivity() {
    private lateinit var viewModel: ProductViewModel
    private lateinit var myAdapter: SanPhamAdapter
    private lateinit var binding: ActivitySearchProductBinding
    private val searchDelayMillis = 1000L // 1 giây
    private var searchJob: Job? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySearchProductBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val factory = ProductViewModelFactory(ProductRepository())
        viewModel = ViewModelProvider(this, factory).get(ProductViewModel::class.java)

        viewModel.products.observe(this, Observer { products ->
            myAdapter = SanPhamAdapter(products)
            myAdapter.onItemClick = { product ->
                returnSelectedProduct(product)
            }
            binding.edtSearch.addTextChangedListener(object : TextWatcher {
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
            binding.rvSanPham.apply {
                adapter = myAdapter
                layoutManager = LinearLayoutManager(this@SearchProductActivity)
            }
        })
        binding.btnBack.setOnClickListener {
            returnSelectedProduct(product = null);
        }
    }
    private fun returnSelectedProduct(product: Product?) {
        val intent = Intent(this@SearchProductActivity, HoaDonActivity::class.java)
        intent.putExtra("product", product)
        setResult(Activity.RESULT_OK, intent)
        finish()
    }
}