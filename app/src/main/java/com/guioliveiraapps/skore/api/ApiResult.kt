package com.guioliveiraapps.skore.api

sealed class ApiResult<out T> {
    class Error(val error: Throwable) : ApiResult<Nothing>()
    class Success<T>(val result: T) : ApiResult<T>()
}