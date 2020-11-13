package com.guioliveiraapps.skore.features.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.guioliveiraapps.skore.R
import com.guioliveiraapps.skore.util.ScreenState
import kotlinx.android.synthetic.main.fragment_home.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class HomeFragment : Fragment() {

    private val viewModel: HomeFragmentViewModel by viewModel()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        setupViewModelObservers()

        viewModel.getClasses()
    }

    private fun setupViewModelObservers() {
        viewModel.screenState.observe(viewLifecycleOwner, {
            when (it) {
                is ScreenState.Loading -> {
                    viewFlipper.displayedChild = viewModel.LOADING_DISPLAYED_CHILD
                }

                is ScreenState.Success -> {
                    viewFlipper.displayedChild = viewModel.SUCCESS_DISPLAYED_CHILD
                }

                is ScreenState.Error -> {
                    viewFlipper.displayedChild = viewModel.ERROR_DISPLAYED_CHILD
                }
            }
        })

        viewModel.classes.observe(viewLifecycleOwner, {
            it?.let { classes ->
                with(rvClasses) {
                    layoutManager =
                        LinearLayoutManager(context, RecyclerView.VERTICAL, false)
                    setHasFixedSize(true)
                    val dividerItemDecoration = DividerItemDecoration(
                        rvClasses.context,
                        (layoutManager as LinearLayoutManager).orientation
                    )
                    rvClasses.addItemDecoration(dividerItemDecoration)
                    adapter = ClassesAdapter(classes) {
                        viewFlipper.displayedChild = viewModel.EMPTY_DISPLAYED_CHILD
                    }
                }
            }
        })
    }
}