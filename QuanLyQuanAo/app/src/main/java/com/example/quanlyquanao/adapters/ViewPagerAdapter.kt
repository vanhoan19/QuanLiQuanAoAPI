package com.example.quanlyquanao.adapters

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import androidx.lifecycle.Lifecycle
import androidx.viewpager2.adapter.FragmentStateAdapter
import com.example.quanlyquanao.ui.fragments.CustomerHistoryFragment
import com.example.quanlyquanao.ui.fragments.CustomerInfoFragment

class ViewPagerAdapter(
    fragmentManager: FragmentManager,
    lifecycle: Lifecycle
) : FragmentStateAdapter(fragmentManager, lifecycle) {
    override fun getItemCount(): Int {
        return 2
    }

    override fun createFragment(position: Int): Fragment {
        return if (position == 0)
             CustomerInfoFragment()
        else CustomerHistoryFragment()
    }
}