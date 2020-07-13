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
        itemView.nameText.text = classroom.name
        itemView.creationDateText.text = getFormattedDate(classroom.createdAtMillis)
        itemView.idText.text = classroom.id
    }

    private fun getFormattedDate(millis: Long): String =
        SimpleDateFormat("dd/MM/yyyy").format(millis)
}
