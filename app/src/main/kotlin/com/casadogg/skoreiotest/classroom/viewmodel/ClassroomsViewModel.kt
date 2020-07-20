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

class ClassroomsViewModel : ViewModel() {
    private val _classrooms = MutableLiveData<List<Classroom>>()
    val classrooms: LiveData<List<Classroom>>
        get() = _classrooms

    private val coroutineJob = Job()
    private val coroutineUiScope = CoroutineScope(Dispatchers.Main + coroutineJob)

    fun init(resources: Resources) {
        coroutineUiScope.launch {
            _classrooms.value = fetchClassrooms(resources)
        }
    }

    private suspend fun fetchClassrooms(resources: Resources): List<Classroom> {
        return withContext(Dispatchers.IO) {
            val inputStream = resources.openRawResource(R.raw.classrooms)
            val mapper = jacksonObjectMapper()
            mapper.readValue<List<Classroom>>(inputStream).also {
                inputStream.close()
            }
        }
    }

    override fun onCleared() {
        super.onCleared()
        coroutineJob.cancel()
    }
}
