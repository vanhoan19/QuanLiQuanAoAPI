package com.example.quanlyquanao.ui

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentTransaction
import com.example.quanlyquanao.R
import com.example.quanlyquanao.databinding.ActivityMainBinding
import com.example.quanlyquanao.retrofit.QLQuanAoApi
import com.example.quanlyquanao.retrofit.RetrofitService
import com.example.quanlyquanao.ui.fragments.BanHangFragment
import com.example.quanlyquanao.utils.functions
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            replaceFragment(BanHangFragment())
            binding.navView.setCheckedItem(R.id.nav_ban_hang)
        }
        binding.apply {

            toolbar.setNavigationOnClickListener {
                drawerLayout.open()
            }
            
            navView.setNavigationItemSelectedListener {menuItem ->
                menuItem.isChecked = true
                drawerLayout.close()
                when(menuItem.itemId) {
                    R.id.nav_ban_hang -> replaceFragment(BanHangFragment())
                    R.id.nav_quan_ly -> Toast.makeText(this@MainActivity, "Quản lý", Toast.LENGTH_SHORT).show()
                    R.id.nav_dang_xuat -> {
                        val intent = Intent(this@MainActivity, LoginActivity::class.java)
                        intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
                        startActivity(intent)
                        finish()
                    }
                }
                return@setNavigationItemSelectedListener true
            }
        }
    }

    private fun replaceFragment(fragment: Fragment) {
        val transaction: FragmentTransaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.nav_host_fragment, fragment)
        transaction.commit()
    }
}