package com.guioliveiraapps.skore.features.home

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.guioliveiraapps.skore.R
import com.guioliveiraapps.skore.model.Class
import com.guioliveiraapps.skore.model.StatusEnum
import kotlinx.android.synthetic.main.item_class.view.*
import java.text.SimpleDateFormat
import java.util.*

class ClassesAdapter(
    private val classes: ArrayList<Class>,
    private val onEmptyList: (() -> Unit)
) :
    RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        internal fun bind(c: Class) {
            itemView.ivRemove.setOnClickListener {
                removeItem(adapterPosition)
            }

            setupNameDateAndId(c)

            if (StatusEnum.NOT_STARTED == c.status) {
                setupNotStartedView()
                return
            }

            if (StatusEnum.IN_PROGRESS == c.status) {
                setupInProgressView(c)
                return
            }

            if (StatusEnum.COMPLETED == c.status) {
                setupCompleteView(c)
                return
            }
        }

        private fun setupNameDateAndId(c: Class) {
            itemView.txtName.text = c.name
            itemView.txtDate.text = convertLongToTime(c.createdAt)
            itemView.txtId.text = getIdText(c.id)
        }

        private fun setupNotStartedView() {
            itemView.classProgress.visibility = View.GONE
            itemView.txtClassProgress.visibility = View.GONE
        }

        private fun setupInProgressView(c: Class) {
            itemView.classProgress.progress = c.summary.percentage
            itemView.txtClassProgress.text = getPercentageText(c.summary.percentage)
        }

        private fun setupCompleteView(c: Class) {
            itemView.classProgress.progress = c.summary.percentage
            itemView.txtClassProgress.visibility = View.GONE
            itemView.ivCompleted.visibility = View.VISIBLE
        }
    }

    private fun getIdText(id: String): CharSequence? {
        return "ID: $id"
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return ViewHolder(
            LayoutInflater.from(parent.context).inflate(R.layout.item_class, parent, false)
        )
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        (holder as ViewHolder).bind(classes[position])
    }

    override fun getItemCount(): Int {
        return classes.size
    }

    private fun removeItem(position: Int) {
        classes.removeAt(position)
        notifyItemRemoved(position)

        if (classes.isEmpty()) onEmptyList()
    }

    private fun getPercentageText(value: Int): String {
        return "$value%"
    }

    fun convertLongToTime(time: Long): String {
        val date = Date(time)
        val format = SimpleDateFormat("dd/MM/yyyy")
        return format.format(date)
    }
}