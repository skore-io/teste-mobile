package com.guioliveiraapps.skore.features.splash

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.guioliveiraapps.skore.util.EventObserver
import com.guioliveiraapps.skore.R
import org.koin.androidx.viewmodel.ext.android.viewModel

class SplashFragment : Fragment() {

    private val viewModel: SplashFragmentViewModel by viewModel()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_splash, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        setupViewModelObservers()

        viewModel.initSplashDelay()
    }

    private fun setupViewModelObservers() {
        viewModel.navigateScreen.observe(viewLifecycleOwner, EventObserver {
            findNavController().navigate(it)
        })
    }
}