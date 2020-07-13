package com.casadogg.skoreiotest.classroom.view

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.casadogg.skoreiotest.classroom.model.Classroom

class ClassroomAdapter : RecyclerView.Adapter<ClassroomViewHolder>() {
    var dataset: List<Classroom> = emptyList()
        set(value) {
            // Instantiate a new list to get a new reference in order to avoid inconsistencies
            // between data and view
            field = List(value.size, value::get)
            notifyDataSetChanged()
        }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ClassroomViewHolder =
        ClassroomViewHolder(LayoutInflater.from(parent.context))

    override fun getItemCount(): Int = dataset.size

    override fun onBindViewHolder(holder: ClassroomViewHolder, position: Int) {
        holder.bind(dataset[position])
    }
}
