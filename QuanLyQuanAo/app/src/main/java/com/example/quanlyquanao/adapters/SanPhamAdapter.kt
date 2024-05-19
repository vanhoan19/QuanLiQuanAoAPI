package com.example.quanlyquanao.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.core.net.toUri
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.quanlyquanao.R
import com.example.quanlyquanao.models.Product
import com.example.quanlyquanao.utils.functions

class SanPhamAdapter(var products: List<Product>) : RecyclerView.Adapter<SanPhamAdapter.MyViewHolder>() {

    var onItemClick : ((Product) -> Unit)? = null

    inner class MyViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val productImage:ImageView  = itemView.findViewById(R.id.imgProduct)
        private val productName:TextView  = itemView.findViewById(R.id.txtProductName)
        private val productSize:TextView  = itemView.findViewById(R.id.txtProductSize)
        private val productId:TextView  = itemView.findViewById(R.id.txtProductId)
        private val productPrice:TextView  = itemView.findViewById(R.id.txtProductPrice)
        private val productQuantity:TextView  = itemView.findViewById(R.id.txtProductQuantity)

        fun bind(product: Product) {
            try {
                Glide.with(itemView).load(product.Anh!!).centerCrop().into(productImage)
            } catch ( _ : Exception) {

            }
            productName.text = product.TenMH
            productId.text = product.MaMH
            productSize.text = product.Size
            productPrice.text = product.GiaBan?.let { functions.convertStringToCurrency(it) }
            productQuantity.text = product.SLTon.toString()
            itemView.setOnClickListener {
                onItemClick?.invoke(product)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.product_item_list,
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