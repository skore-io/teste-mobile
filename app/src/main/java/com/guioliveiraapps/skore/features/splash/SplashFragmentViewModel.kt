package com.guioliveiraapps.skore.features.splash

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.guioliveiraapps.skore.util.CoroutineContextProvider
import com.guioliveiraapps.skore.util.Event
import com.guioliveiraapps.skore.R
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class SplashFragmentViewModel(
    private val dispatcher: CoroutineContextProvider
) : ViewModel() {

    private val SPLASH_DURATION_TIME_MILLIS: Long = 3000L

    private val _navigateScreen = MutableLiveData<Event<Int>>()
    val navigateScreen: LiveData<Event<Int>> get() = _navigateScreen

    fun initSplashDelay() {
        viewModelScope.launch(dispatcher.IO) {
            delay(SPLASH_DURATION_TIME_MILLIS)
            _navigateScreen.postValue(Event(R.id.action_splashFragment_to_homeFragment))
        }
    }
}