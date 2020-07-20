package com.casadogg.skoreiotest.classroom.view

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager.VERTICAL
import com.casadogg.skoreiotest.R
import com.casadogg.skoreiotest.classroom.ClassroomsViewModel
import kotlinx.android.synthetic.main.activity_classrooms.*

class ClassroomsActivity : AppCompatActivity() {
    private lateinit var classroomsViewModel: ClassroomsViewModel
    private val classroomAdapter = ClassroomAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_classrooms)
        classroomsViewModel = ViewModelProvider(this)[ClassroomsViewModel::class.java]
        classroomsRecyclerView.apply {
            layoutManager = LinearLayoutManager(context, VERTICAL, false)
            adapter = classroomAdapter
        }
        classroomsViewModel.classrooms.observe(this, Observer { classrooms ->
            classroomAdapter.dataset = classrooms
        })
        classroomsViewModel.fetchClassrooms(resources)
    }
}
