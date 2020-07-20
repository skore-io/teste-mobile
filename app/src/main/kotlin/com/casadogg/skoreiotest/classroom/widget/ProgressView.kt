package com.casadogg.skoreiotest.classroom.widget

import android.content.Context
import android.graphics.*
import android.graphics.Paint.ANTI_ALIAS_FLAG
import android.graphics.drawable.Drawable
import android.util.AttributeSet
import android.util.TypedValue
import android.util.TypedValue.COMPLEX_UNIT_DIP
import android.view.Gravity
import androidx.annotation.ColorRes
import androidx.annotation.Px
import androidx.appcompat.widget.AppCompatTextView
import androidx.core.content.ContextCompat
import com.casadogg.skoreiotest.R

class ProgressView : AppCompatTextView {
    private val diameter: Float
    private val strokeWidth: Float
    private val outlinePaint: Paint
    private val progressPaint: Paint
    private val completedPaint: Paint
    private val completedIcon: Drawable
    private val iconSize: Float

    var percentage: Int = 0
        set(value) {
            field = value
            if (value < 100) {
                text = value.toString()
            } else {
                text = ""
            }
            invalidate()
        }

    init {
        diameter = getDimension(DIAMETER_PX)
        strokeWidth = getDimension(STROKE_WIDTH_PX)
        outlinePaint = newPaint(R.color.colorAccentLight)
        progressPaint = newPaint(R.color.colorAccent)
        completedPaint = newPaint(R.color.kokiri)
        gravity = Gravity.CENTER
        completedIcon = ContextCompat.getDrawable(context, R.drawable.ic_check_16)!!.mutate().also {
            it.colorFilter = PorterDuffColorFilter(
                ContextCompat.getColor(context, R.color.kokiri),
                PorterDuff.Mode.SRC_ATOP
            )
        }
        iconSize = getDimension(ICON_SIZE_PX)
    }

    constructor(context: Context) : super(context)
    constructor(context: Context, attrs: AttributeSet) : super(context, attrs)
    constructor(context: Context, attrs: AttributeSet, defStyleAttr: Int) : super(
        context,
        attrs,
        defStyleAttr
    )

    override fun onDraw(canvas: Canvas) {
        canvas.apply {
            drawOutlineCircle()
            drawProgress()
            drawProgressIcon()
        }

        super.onDraw(canvas)
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val size = (diameter + strokeWidth).toInt()
        val sizeMeasureSpec = MeasureSpec.makeMeasureSpec(size, MeasureSpec.EXACTLY)
        super.onMeasure(sizeMeasureSpec, sizeMeasureSpec)
    }

    private fun getDimension(@Px dimension: Float) =
        TypedValue.applyDimension(COMPLEX_UNIT_DIP, dimension, resources.displayMetrics)

    private fun newPaint(@ColorRes color: Int) = Paint().also {
        it.strokeWidth = strokeWidth
        it.flags = ANTI_ALIAS_FLAG
        it.style = Paint.Style.STROKE
        it.color = ContextCompat.getColor(context, color)
    }

    private fun Canvas.drawProgressIcon() {
        if (percentage < 100) return
        val left = ((measuredWidth / 2) - (iconSize / 2)).toInt()
        val top = ((measuredHeight / 2) - (iconSize / 2)).toInt()
        val right = (left + iconSize).toInt()
        val bottom = (top + iconSize).toInt()
        completedIcon.setBounds(left, top, right, bottom)
        completedIcon.draw(this)
    }

    private fun Canvas.drawProgress() {
        val left = strokeWidth / 2
        val top = strokeWidth / 2
        val right = left + diameter
        val bottom = top + diameter
        val sweepAngle = (percentage / 100f) * 360f
        val rect = RectF(left, top, right, bottom)
        val paint = progressPaint.takeIf { percentage < 100 } ?: completedPaint
        drawArc(rect, PROGRESS_START_ANGLE, sweepAngle, false, paint)
    }

    private fun Canvas.drawOutlineCircle() {
        val radius = (diameter / 2)
        val center = (diameter / 2) + (strokeWidth / 2)
        drawCircle(center, center, radius, outlinePaint)
    }

    companion object {
        private const val DIAMETER_PX = 48f
        private const val STROKE_WIDTH_PX = 3f
        private const val PROGRESS_START_ANGLE = 270f
        private const val ICON_SIZE_PX = 24f
    }
}
