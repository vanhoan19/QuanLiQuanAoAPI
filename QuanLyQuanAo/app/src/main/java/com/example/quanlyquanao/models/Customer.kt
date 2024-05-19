package com.example.quanlyquanao.models

import android.os.Parcel
import android.os.Parcelable

data class Customer(
    val DiaChi: String,
    val MaKH: Int,
    val MaNV: Int,
    val SDT: String,
    val TenKH: String
) : Parcelable {
    constructor(parcel: Parcel) : this(
        parcel.readString()!!,
        parcel.readInt(),
        parcel.readInt(),
        parcel.readString()!!,
        parcel.readString()!!
    ) {
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(DiaChi)
        parcel.writeInt(MaKH)
        parcel.writeInt(MaNV)
        parcel.writeString(SDT)
        parcel.writeString(TenKH)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<Customer> {
        override fun createFromParcel(parcel: Parcel): Customer {
            return Customer(parcel)
        }

        override fun newArray(size: Int): Array<Customer?> {
            return arrayOfNulls(size)
        }
    }
}