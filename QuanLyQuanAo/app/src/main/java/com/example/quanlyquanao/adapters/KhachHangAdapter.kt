package com.example.quanlyquanao.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.quanlyquanao.R
import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.utils.functions.Companion.formatPhoneNumber

class KhachHangAdapter(var lstKhachHang: MutableList<Customer>): RecyclerView.Adapter<KhachHangAdapter.MyViewHolder>() {
    var onItemClick: ((Customer) -> Unit)? = null
    var onItemDetail: ((Customer) -> Unit)? = null
    inner class MyViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        private val imgCustomer: TextView = itemView.findViewById(R.id.imgCustomer)
        private val txtCustomerName: TextView = itemView.findViewById(R.id.txtCustomerName)
        private val txtMaKH: TextView = itemView.findViewById(R.id.txtMaKH)
        private val txtCustomerPhone: TextView = itemView.findViewById(R.id.txtCustomerPhone)
        private val btnDetail: ImageView = itemView.findViewById(R.id.btnDetail)
        @SuppressLint("SetTextI18n")
        fun bind(customer: Customer) {
            val words = customer.TenKH.trim().split(" ")
            imgCustomer.text = words.last().trim()[0].toString()
            txtCustomerName.text = customer.TenKH
            txtMaKH.text = "MaKH: " + customer.MaKH.toString()
            txtCustomerPhone.text = formatPhoneNumber(customer.SDT)
            itemView.apply {
                setOnClickListener {
                    onItemClick?.invoke(customer)
                }
            }
            btnDetail.setOnClickListener {
                onItemDetail?.invoke(customer)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.customer_item_list,
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return lstKhachHang.size
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        val customer = lstKhachHang[position]
        holder.bind(customer)
    }
}