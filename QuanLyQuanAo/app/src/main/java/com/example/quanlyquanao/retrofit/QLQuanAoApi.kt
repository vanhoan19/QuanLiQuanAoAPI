package com.example.quanlyquanao.retrofit

import com.example.quanlyquanao.models.Customer
import com.example.quanlyquanao.models.Employee
import com.example.quanlyquanao.models.Invoice
import com.example.quanlyquanao.models.InvoiceDetail
import com.example.quanlyquanao.models.Product
import retrofit2.Call
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.PUT
import retrofit2.http.Path

interface QLQuanAoApi {

    @FormUrlEncoded
    @POST("/login")
    fun checkLogin(
        @Field("UserName") userName: String,
        @Field("passWord") passWord: String
    ): Call<Employee>

    @GET("/products")
    fun listProducts(): Call<List<Product>>

    @GET("/customers")
    fun listCustomers(): Call<MutableList<Customer>>

    @FormUrlEncoded
    @PUT("/customers/{MaKH}")
    fun updateCustomer(
        @Path("MaKH") MaKH: Int,
        @Field("TenKH") TenKH: String,
        @Field("SDT") SDT: String,
        @Field("DiaChi") DiaChi: String,
    ): Call<Map<String, String>>

    @POST("/customers")
    fun insertCustomer(
        @Body customer: Customer
    ): Call<Map<String, String>>

    @PUT("/customers")
    fun updateCustomer(
        @Body customer: Customer
    ): Call<Map<String, String>>

    @POST("/invoices")
    fun insertInvoice(
        @Body invoice: Invoice
    ): Call<Map<String, String>>

    @POST("/invoiceDetails")
    fun insertInvoiceDetails(
        @Body invoices: MutableList<InvoiceDetail>
    ): Call<Map<String, String>>

    @GET("/invoices/getSum/{customerID}")
    fun getSumByCustomerID(
        @Path("customerID") customerID: Int
    ): Call<String>

    @GET("/invoices/{customerID}")
    fun getInvoicesByCustomerID(
        @Path("customerID") customerID: Int
    ): Call<List<Invoice>>
}