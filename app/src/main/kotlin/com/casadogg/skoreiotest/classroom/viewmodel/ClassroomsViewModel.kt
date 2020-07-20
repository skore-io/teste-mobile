package com.casadogg.skoreiotest.classroom.viewmodel

import android.content.res.Resources
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.casadogg.skoreiotest.R
import com.casadogg.skoreiotest.classroom.model.Classroom
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import kotlinx.coroutines.*
import java.util.*
import kotlin.Comparator

class ClassroomsViewModel : ViewModel() {
    private val _classrooms = MutableLiveData<MutableList<Classroom>>()
    val classrooms: LiveData<List<Classroom>>
        get() = _classrooms as LiveData<List<Classroom>>

    private val coroutineJob = Job()
    private val coroutineUiScope = CoroutineScope(Dispatchers.Main + coroutineJob)

    fun init(resources: Resources) {
        if (_classrooms.value != null) return
        coroutineUiScope.launch {
            _classrooms.value = fetchClassrooms(resources)
        }
    }

    fun onClassroomDeleted(deletedClassroom: Classroom) {
        _classrooms.value?.remove(deletedClassroom)
    }

    private suspend fun fetchClassrooms(resources: Resources): MutableList<Classroom> {
        return withContext(Dispatchers.IO) {
            val inputStream = resources.openRawResource(R.raw.classrooms)
            val mapper = jacksonObjectMapper()
            val classrooms = mapper.readValue<MutableList<Classroom>>(inputStream)
            inputStream.close()
            classrooms.sortByCreationDateDescending()
        }
    }

    override fun onCleared() {
        super.onCleared()
        coroutineJob.cancel()
    }

    private fun MutableList<Classroom>.sortByCreationDateDescending(): MutableList<Classroom> =
        this.sortedWith(Comparator { classroom1, classroom2 ->
            Date(classroom2.createdAt).compareTo(Date(classroom1.createdAt))
        }).toMutableList()
}
