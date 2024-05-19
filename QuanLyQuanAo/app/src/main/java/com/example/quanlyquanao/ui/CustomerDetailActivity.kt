package com.example.quanlyquanao.ui

import android.app.Activity
import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.annotation.RequiresApi
import androidx.lifecycle.ViewModelProvider
import androidx.viewpager2.widget.ViewPager2
import com.example.quanlyquanao.adapters.ViewPagerAdapter
import com.example.quanlyquanao.databinding.ActivityCustomerDetailBinding
import com.example.quanlyquanao.repository.CustomerRepository
import com.example.quanlyquanao.ui.viewModelFacroties.CustomerViewModelFactory
import com.example.quanlyquanao.ui.viewModels.CustomerViewModel
import com.example.quanlyquanao.utils.functions
import com.example.quanlyquanao.utils.variables

class CustomerDetailActivity : AppCompatActivity() {
    private lateinit var binding: ActivityCustomerDetailBinding
    private lateinit var myAdapter: ViewPagerAdapter

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCustomerDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)

        myAdapter = ViewPagerAdapter(supportFragmentManager, lifecycle)

        binding.apply {
            val words = variables.customer.TenKH.trim().split(" ")
            txtCustomerName.text = words.last().trim()[0].toString()
            tabLayout.addTab(binding.tabLayout.newTab().setText("Thông tin"))
            tabLayout.addTab(binding.tabLayout.newTab().setText("Lịch sử"))

            viewPager2.adapter = myAdapter

            viewPager2.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
                override fun onPageSelected(position: Int) {
                    super.onPageSelected(position)
                    binding.tabLayout.selectTab(binding.tabLayout.getTabAt(position))
                }
            })

            btnBack.setOnClickListener {
                val intent = Intent()
                setResult(Activity.RESULT_OK, intent)
                finish()
            }
        }
    }
}