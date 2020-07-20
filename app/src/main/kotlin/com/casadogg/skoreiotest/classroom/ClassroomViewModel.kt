package com.casadogg.skoreiotest.classroom

import android.content.res.Resources
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.casadogg.skoreiotest.R
import com.casadogg.skoreiotest.classroom.model.Classroom
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue

class ClassroomViewModel : ViewModel() {
    private val _classrooms = MutableLiveData<List<Classroom>>()
    val classrooms: LiveData<List<Classroom>>
        get() = _classrooms

    fun fetchClassrooms(resources: Resources) {
        val inputStream = resources.openRawResource(R.raw.classrooms)
        val mapper = jacksonObjectMapper()

        val classrooms: List<Classroom> = mapper.readValue(inputStream)
        _classrooms.value = classrooms
    }
}
