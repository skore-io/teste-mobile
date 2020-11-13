package com.guioliveiraapps.skore.features.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.extensions.default
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.model.Class
import com.guioliveiraapps.skore.util.CoroutineContextProvider
import com.guioliveiraapps.skore.util.ScreenState
import kotlinx.coroutines.launch

class HomeFragmentViewModel(
    private val classRepository: ClassRepository,
    private val dispatcher: CoroutineContextProvider
) : ViewModel() {

    var doRequest = true

    val LOADING_DISPLAYED_CHILD: Int = 0
    val SUCCESS_DISPLAYED_CHILD: Int = 1
    val ERROR_DISPLAYED_CHILD: Int = 2
    val EMPTY_DISPLAYED_CHILD: Int = 3

    private val _classes: MutableLiveData<ArrayList<Class>> = MutableLiveData()
    val classes: LiveData<ArrayList<Class>> get() = _classes

    private val _screenState: MutableLiveData<ScreenState> =
        MutableLiveData<ScreenState>().default(ScreenState.Loading)
    val screenState: LiveData<ScreenState> get() = _screenState


    fun getClasses() {
        viewModelScope.launch(dispatcher.IO) {
            if (!doRequest) {
                return@launch
            }
            doRequest = false

            val apiResult = classRepository.getClasses()

            if (apiResult is ApiResult.Success) {
                val sorted = apiResult.result.sortedBy { it.createdAt }
                _classes.postValue(ArrayList(sorted))
                _screenState.postValue(ScreenState.Success)
                return@launch
            }
            _screenState.postValue(ScreenState.Error(null))
        }
    }
}