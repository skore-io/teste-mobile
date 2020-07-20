package com.casadogg.skoreiotest.classroom.view

import android.view.LayoutInflater
import androidx.recyclerview.widget.RecyclerView
import com.casadogg.skoreiotest.R
import com.casadogg.skoreiotest.classroom.model.Classroom
import kotlinx.android.synthetic.main.viewholder_classroom.view.*
import java.text.SimpleDateFormat

class ClassroomViewHolder(
    layoutInflater: LayoutInflater
) : RecyclerView.ViewHolder(
    layoutInflater.inflate(R.layout.viewholder_classroom, null, false)
) {
    fun bind(classroom: Classroom) {
        itemView.apply {
            nameText.text = classroom.name
            creationDateText.text = getFormattedDate(classroom.createdAt)
            idText.text = classroom.id
            progress.percentage = classroom.summary.percentage
        }
    }

    private fun getFormattedDate(millis: Long): String =
        SimpleDateFormat("dd/MM/yyyy").format(millis)
}
