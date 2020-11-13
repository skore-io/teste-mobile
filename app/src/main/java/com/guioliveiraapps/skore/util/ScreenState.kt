package com.guioliveiraapps.skore.util

sealed class ScreenState {
    class Error(val error: Throwable?) : ScreenState()
    object Success : ScreenState()
    object Loading : ScreenState()
}