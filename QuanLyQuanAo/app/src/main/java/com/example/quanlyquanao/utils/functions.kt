package com.example.quanlyquanao.utils

import android.annotation.SuppressLint
import android.content.Context
import android.os.Build
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.RequiresApi
import com.example.quanlyquanao.adapters.SanPhamAdapter
import com.example.quanlyquanao.models.Product
import java.text.DecimalFormat
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.ZoneId
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter

class functions {
    companion object {
        fun convertStringToCurrency(giaBanString: String): String {
            val giaBanDouble = giaBanString.toDouble()
            val decimalFormat = DecimalFormat("#,###")
            val giaBanFormatted = decimalFormat.format(giaBanDouble)
            return giaBanFormatted
        }
        fun convertCurrencyToDouble(currencyString: String): Double {
            // Loại bỏ dấu phân tách (ví dụ: dấu phẩy)
            val cleanedString = currencyString.replace(",", "")

            // Chuyển chuỗi thành kiểu số thực
            return cleanedString.toDoubleOrNull() ?: 0.0
        }
        fun print(context: Context, str: String) {
            Toast.makeText(context, str, Toast.LENGTH_SHORT).show()
        }
        fun filterProducts(productList: List<Product>, words: List<String>): List<Product> {
            val filteredList: MutableList<Product> = ArrayList()
            for (product in productList) {
                if (isValid(product, words)) {
                    filteredList.add(product)
                }
            }
            return filteredList
        }

        private fun isValid(product: Product, words: List<String>): Boolean {
            val tenMH = product.TenMH?.lowercase()
            val maMH = product.MaMH?.lowercase()

            for(word in words) {
                if (!tenMH?.contains(word.trim())!! && !maMH?.contains(word.trim())!!) return false
            }
            return true
        }

        // Phương thức để cập nhật RecyclerView:
        @SuppressLint("NotifyDataSetChanged")
        fun updateRecyclerView(myAdapter: SanPhamAdapter, filteredList: List<Product>) {
            myAdapter.products = filteredList
            myAdapter.notifyDataSetChanged()
        }

        fun formatPhoneNumber(phoneNumber: String): String {
            var result = ""
            if (phoneNumber.length >= 4) {
                result = phoneNumber.substring(phoneNumber.length - 4)
            }
            else result = phoneNumber
            if (result.isNotEmpty()) {
                result ="*".repeat(7 - result.length) + result
            }
            return result
        }
        fun updateCustomer(textView: TextView) {
            textView.text = variables.customer.TenKH
        }

        @SuppressLint("SimpleDateFormat")
        fun convertGMTStringToFormattedString(gmtString: String): String {
            val dateFormat = SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z")
            val date = dateFormat.parse(gmtString)
            val targetFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
            return targetFormat.format(date!!)
        }


    }
}