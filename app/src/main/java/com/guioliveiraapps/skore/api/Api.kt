package com.guioliveiraapps.skore.api

import com.guioliveiraapps.skore.model.Class
import retrofit2.Response
import retrofit2.http.GET

interface Api {
    @GET("aulas")
    suspend fun getClasses(): Response<List<Class>>
}