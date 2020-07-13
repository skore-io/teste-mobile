package com.casadogg.skoreiotest.classroom.view

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager.VERTICAL
import com.casadogg.skoreiotest.R
import kotlinx.android.synthetic.main.activity_classrooms.*

class ClassroomsActivity : AppCompatActivity() {
    private val classroomAdapter = ClassroomAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_classrooms)
        classroomsRecyclerView.apply {
            layoutManager = LinearLayoutManager(context, VERTICAL, false)
            adapter = classroomAdapter
        }
    }
}
