package com.example.quanlyquanao.models

data class Invoice(
    val GiamGia: String,
    val MaHDB: String,
    val MaKH: Int,
    val MaNV: Int,
    val PhuongThucTT: Boolean = false,
    val ThanhToan: String,
    val TongTien: String,
    val createdAt: String
)