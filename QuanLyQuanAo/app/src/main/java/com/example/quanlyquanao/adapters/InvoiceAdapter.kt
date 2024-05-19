package com.example.quanlyquanao.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.quanlyquanao.R
import com.example.quanlyquanao.models.Invoice
import com.example.quanlyquanao.utils.functions

class InvoiceAdapter(var lstInvoices: List<Invoice>) : RecyclerView.Adapter<InvoiceAdapter.MyViewHolder>() {
    inner class MyViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        private val txtMaHDB: TextView = itemView.findViewById(R.id.txtMaHDB)
        private val txtTongTien: TextView = itemView.findViewById(R.id.txtTongTienHDB)
        private val txtPhuongThucTT: TextView = itemView.findViewById(R.id.txtPhuongThucTT)
        private val txtNgayTao: TextView = itemView.findViewById(R.id.txtCreatedAt)

        @SuppressLint("SetTextI18n")
        fun bind(invoice: Invoice) {
            txtMaHDB.text = "HDB" + adapterPosition.toString()
            txtTongTien.text = functions.convertStringToCurrency(invoice.TongTien)
            if (!invoice.PhuongThucTT)
                txtPhuongThucTT.text = "TM"
            else txtPhuongThucTT.text = "CK"
            txtNgayTao.text = functions.convertGMTStringToFormattedString(invoice.createdAt)
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.invoice_item_list,
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return lstInvoices.size
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        val invoice = lstInvoices[position]
        holder.bind(invoice)
    }
}