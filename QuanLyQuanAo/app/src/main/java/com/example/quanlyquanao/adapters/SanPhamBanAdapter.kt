package com.example.quanlyquanao.adapters

import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import com.example.quanlyquanao.R
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.models.ProductBan
import com.example.quanlyquanao.utils.functions
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class SanPhamBanAdapter(var products: MutableList<ProductBan>) : RecyclerView.Adapter<SanPhamBanAdapter.MyViewHolder>() {

    inner class MyViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val productName:TextView  = itemView.findViewById(R.id.txtProductName)
        private val productId:TextView  = itemView.findViewById(R.id.txtProductId)
        private val productPrice:TextView  = itemView.findViewById(R.id.txtProductPrice)
        private val productSLBan:EditText  = itemView.findViewById(R.id.edtProductSLBan)
        private val btnPlus:TextView = itemView.findViewById(R.id.btnPlus)
        private val btnMinus:TextView = itemView.findViewById(R.id.btnMinus)

        fun bind(productBan: ProductBan) {
            productName.text = productBan.product.TenMH
            productId.text = productBan.product.MaMH
            productPrice.text = productBan.product.GiaBan?.let { functions.convertStringToCurrency(it) }
            productSLBan.setText(productBan.slBan.toString())
            if (productBan.slBan > productBan.product.SLTon) {
                productSLBan.setTextColor(ContextCompat.getColor(itemView.context, R.color.red))
            }
            else {
                productSLBan.setTextColor(ContextCompat.getColor(itemView.context, R.color.black))
            }
            btnPlus.setOnClickListener {
                productSLBan.clearFocus()
                onPlusItemClick?.invoke(productBan)
            }
            btnMinus.setOnClickListener {
                productSLBan.clearFocus()
                onMinusItemClick?.invoke(productBan)
            }
            productSLBan.setOnFocusChangeListener { v, hasFocus ->
                if (!hasFocus) {
                    onFocusEditTextSLBan?.invoke(productBan, productSLBan.text.toString().toInt())
                }
            }
        }
    }

    var onPlusItemClick: ((ProductBan) -> Unit)? = null
    var onMinusItemClick: ((ProductBan) -> Unit)? = null
    var onFocusEditTextSLBan: ((ProductBan, Int) -> Unit)? = null

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.product_item_list_ban_hang,
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return products.size
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        val product = products[position]
        holder.bind(product)
    }
}