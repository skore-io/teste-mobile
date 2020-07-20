package com.casadogg.skoreiotest.classroom.view

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.casadogg.skoreiotest.classroom.model.Classroom

class ClassroomAdapter(
    private val onDelete: (deletedClassroom: Classroom) -> Unit
) : RecyclerView.Adapter<ClassroomViewHolder>() {
    private var dataset: MutableList<Classroom> = mutableListOf()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ClassroomViewHolder =
        ClassroomViewHolder(LayoutInflater.from(parent.context), parent)

    override fun getItemCount(): Int = dataset.size

    override fun onBindViewHolder(holder: ClassroomViewHolder, position: Int) {
        holder.bind(
            dataset[position],
            onDelete = { deletePosition ->
                onDelete(dataset.removeAt(deletePosition))
                notifyItemRemoved(deletePosition)
            }
        )
    }

    fun setDataset(dataset: List<Classroom>) {
        // Instantiate a new list to get a new reference in order to avoid inconsistencies
        // between data and view
        this.dataset = MutableList(dataset.size, dataset::get)
        notifyDataSetChanged()
    }
}
