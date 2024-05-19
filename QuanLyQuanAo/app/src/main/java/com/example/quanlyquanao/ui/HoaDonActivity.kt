package com.example.quanlyquanao.ui

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.RequiresApi
import androidx.recyclerview.widget.ItemTouchHelper
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.quanlyquanao.adapters.SanPhamBanAdapter
import com.example.quanlyquanao.databinding.ActivityHoaDonBinding
import com.example.quanlyquanao.models.Invoice
import com.example.quanlyquanao.models.InvoiceDetail
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.models.ProductBan
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.functions.Companion.convertCurrencyToDouble
import com.example.quanlyquanao.utils.functions.Companion.convertStringToCurrency
import com.example.quanlyquanao.utils.functions.Companion.print
import com.example.quanlyquanao.utils.variables
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.UUID

class HoaDonActivity : AppCompatActivity() {
    private lateinit var myAdapter: SanPhamBanAdapter
    private lateinit var lstSanPhamBan: MutableList<ProductBan>
    private lateinit var binding: ActivityHoaDonBinding
    private val giamGiaDelayMillis = 1000L // 1 giây
    private var searchJob: Job? = null

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHoaDonBinding.inflate(layoutInflater)
        setContentView(binding.root)
        lstSanPhamBan = ArrayList()
        myAdapter = SanPhamBanAdapter(lstSanPhamBan)
        binding.apply {
            txtKhachHang.text = variables.customer.TenKH
            closeHoaDon.setOnClickListener {
                val intent = Intent(this@HoaDonActivity, MainActivity::class.java)
                intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
                startActivity(intent)
                finish()
            }
            txtKhachHang.setOnClickListener {
                openCustomerDetailActivity()
            }
            edtGiamGia.addTextChangedListener ( object : TextWatcher {
                override fun afterTextChanged(s: Editable?) {
                    searchJob?.cancel()
                    searchJob = CoroutineScope(Dispatchers.Main).launch {
                        delay(giamGiaDelayMillis)
                        updateThanhTien()
                    }
                }
                override fun beforeTextChanged( s: CharSequence?, start: Int, count: Int, after: Int) {}
                override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            } )
            edtSearch.setOnFocusChangeListener { v, hasFocus ->
                if (hasFocus) {
                    openSearchProductActivity()
                    edtSearch.clearFocus()
                }
            }
            rvSanPhamHoaDon.apply {
                adapter = myAdapter
                layoutManager = LinearLayoutManager(this@HoaDonActivity)
            }
            btnThanhToan.setOnClickListener {
                insertInvoice()
            }
        }
        myAdapter.onPlusItemClick = {product ->
            updateChangeSLProducts(product, 1)
        }
        myAdapter.onMinusItemClick = {product ->
            if (product.slBan > 1) {
                updateChangeSLProducts(product, -1)
            }
        }
        myAdapter.onFocusEditTextSLBan = {productBan, slBanNew ->
            if (slBanNew != productBan.slBan) {
                updateChangeSLProducts(productBan, slBanNew - productBan.slBan)
            }
        }
        ItemTouchHelper(object : ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT) {
            override fun onMove(
                recyclerView: RecyclerView,
                viewHolder: RecyclerView.ViewHolder,
                target: RecyclerView.ViewHolder
            ): Boolean {
                return false
            }

            override fun onSwiped(viewHolder: RecyclerView.ViewHolder, direction: Int) {
                val position = viewHolder.adapterPosition
                val deletedProduct = lstSanPhamBan.get(position)
                updateChangeSLProducts(deletedProduct, -deletedProduct.slBan)
                lstSanPhamBan.removeAt(position)
                myAdapter.notifyItemRemoved(position)
            }
        }).attachToRecyclerView(binding.rvSanPhamHoaDon)

        val product = intent.getParcelableExtra("product", Product::class.java)
        if (product != null) {
            updateProductList(product)
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun insertInvoice() {
        val MaHDB = UUID.randomUUID().toString()
        val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        val invoice = Invoice(
            binding.edtGiamGia.text.toString(),
            MaHDB,
            variables.customer.MaKH,
            variables.curEmployee!!.MaNV,
            false,
            binding.txtThanhTien.text.toString(),
            binding.txtTongTien.text.toString(),
            LocalDateTime.now().format(formatter)
        )
        val invoiceDetails: MutableList<InvoiceDetail> = invoiceDetails(MaHDB, lstSanPhamBan)
        if (invoiceDetails.size > 0) {
            RetrofitService.instance.insertInvoice(invoice).enqueue(object : Callback<Map<String, String>?> {
                override fun onResponse(
                    call: Call<Map<String, String>?>,
                    response: Response<Map<String, String>?>
                ) {
                    if (response.isSuccessful) {
                        insertInvoiceDetails(invoiceDetails)
                    }
                }

                override fun onFailure(call: Call<Map<String, String>?>, t: Throwable) {}
            })
        }
        else {
            print(this@HoaDonActivity, "Đơn hàng chưa có sản phẩm nào hoặc có sản phẩm số lượng bán > số lượng tồn")
        }
    }

    private fun invoiceDetails(MaHDB: String, lstSanPhamBan: MutableList<ProductBan>): MutableList<InvoiceDetail> {
        var invoiceDetails: MutableList<InvoiceDetail> = ArrayList()
        for (productBan in lstSanPhamBan) {
            if (productBan.slBan <= 0 || productBan.slBan > productBan.product.SLTon) return ArrayList()
            invoiceDetails.add(InvoiceDetail(MaHDB, productBan.product.MaMH!!, productBan.slBan))
        }
        binding.txtTongSL.setText("0")
        binding.txtTongTien.setText("0")
        binding.txtThanhTien.setText("0")
        binding.edtGiamGia.setText("0")
        return invoiceDetails
    }

    private fun insertInvoiceDetails(invoiceDetails: MutableList<InvoiceDetail>) {
        RetrofitService.instance.insertInvoiceDetails(invoiceDetails).enqueue(object : Callback<Map<String, String>?> {
            @SuppressLint("NotifyDataSetChanged")
            override fun onResponse(
                call: Call<Map<String, String>?>,
                response: Response<Map<String, String>?>
            ) {
                if (response.isSuccessful) {
                    print(this@HoaDonActivity, "Success!")
                    lstSanPhamBan.clear()
                    myAdapter.notifyDataSetChanged()
                }
            }

            override fun onFailure(call: Call<Map<String, String>?>, t: Throwable) {
                TODO("Not yet implemented")
            }
        })
    }


    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private val searchProductResultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val selectedProduct = result.data?.getParcelableExtra("product", Product::class.java)
            selectedProduct?.let {
                updateProductList(it)
            }
        }
    }

    @SuppressLint("NotifyDataSetChanged", "SetTextI18n")
    private fun updateProductList(product: Product) {
        if (lstSanPhamBan.firstOrNull { it.product == product } == null) {
            val productBan = ProductBan(product)
            lstSanPhamBan.add(productBan)
            myAdapter.notifyDataSetChanged()
            updateChangeSLProducts(productBan, 1)
        }
    }

    fun updateChangeSLProducts(productBan: ProductBan, sl: Int) {
        if (sl != 0) {
            productBan.slBan += sl
            myAdapter.notifyItemChanged(lstSanPhamBan.indexOfFirst { it.product == productBan.product })
            val tongTien = convertCurrencyToDouble(binding.txtTongTien.text.toString()) + sl * productBan.product.GiaBan.toString().toDouble()
            binding.apply {
                txtTongTien.text =
                    convertStringToCurrency(tongTien.toString())
                txtTongSL.text =
                    (txtTongSL.text.toString().toInt() + sl).toString()
            }
            updateThanhTien()
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    fun openSearchProductActivity() {
        val intent = Intent(this, SearchProductActivity::class.java)
        searchProductResultLauncher.launch(intent)
    }

    fun updateThanhTien() {
        val tongTien = convertCurrencyToDouble(binding.txtTongTien.text.toString())
        val giamGia = convertCurrencyToDouble(binding.edtGiamGia.text.toString())
        binding.txtThanhTien.text = convertStringToCurrency((tongTien - giamGia).toString())
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private val searchCustomerResultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        binding.txtKhachHang.text = variables.customer.TenKH
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    fun openCustomerDetailActivity() {
        val intent = Intent(this, KhachHangActivity::class.java)
        searchCustomerResultLauncher.launch(intent)
    }
}