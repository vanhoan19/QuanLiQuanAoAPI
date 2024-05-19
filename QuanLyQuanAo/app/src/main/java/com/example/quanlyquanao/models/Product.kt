package com.example.quanlyquanao.models

import android.os.Parcel
import android.os.Parcelable
import java.io.Serializable

data class Product(
    val Anh: String?,
    val GiaBan: String?,
    val MaMH: String?,
    val Mau: String?,
    val SLTon: Int,
    val Size: String?,
    val TenMH: String?
) : Parcelable {
    constructor(parcel: Parcel) : this(
        parcel.readString(),
        parcel.readString(),
        parcel.readString(),
        parcel.readString(),
        parcel.readInt(),
        parcel.readString(),
        parcel.readString()
    ) {
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(Anh)
        parcel.writeString(GiaBan)
        parcel.writeString(MaMH)
        parcel.writeString(Mau)
        parcel.writeInt(SLTon)
        parcel.writeString(Size)
        parcel.writeString(TenMH)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<Product> {
        override fun createFromParcel(parcel: Parcel): Product {
            return Product(parcel)
        }

        override fun newArray(size: Int): Array<Product?> {
            return arrayOfNulls(size)
        }
    }
}