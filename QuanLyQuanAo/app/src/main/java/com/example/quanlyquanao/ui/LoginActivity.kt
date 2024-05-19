package com.example.quanlyquanao.ui

import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.annotation.RequiresApi
import com.example.quanlyquanao.databinding.ActivityLoginBinding
import com.example.quanlyquanao.models.Employee
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.variables
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.util.UUID

class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding
    @RequiresApi(Build.VERSION_CODES.O)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)
//        functions.print(this@LoginActivity, UUID.randomUUID().toString())
        binding.btnLogin.setOnClickListener {
            val userName = binding.edtUserName.text.toString()
            val passWord = binding.edtPassword.text.toString()
            RetrofitService.instance.checkLogin(userName, passWord).enqueue(object : Callback<Employee?> {
                override fun onResponse(call: Call<Employee?>, response: Response<Employee?>) {
                    if (response.isSuccessful) {
                        variables.curEmployee = response.body()
                        val intent = Intent(this@LoginActivity, MainActivity::class.java)
                        startActivity(intent)
//                        functions.print(this@LoginActivity, variables.curEmployee?.MaNV.toString())
                    }
                    else {
                        functions.print(this@LoginActivity, "Tên đăng nhập hoặc mât khẩu không đúng!")
                    }
                }

                override fun onFailure(call: Call<Employee?>, t: Throwable) {
                    TODO("Not yet implemented")
                }
            })
        }
    }
}