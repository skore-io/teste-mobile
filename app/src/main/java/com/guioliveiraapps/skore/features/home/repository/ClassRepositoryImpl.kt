package com.guioliveiraapps.skore.features.home.repository

import com.guioliveiraapps.skore.api.Api
import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.model.Class

class ClassRepositoryImpl(private val api: Api) : ClassRepository {
    override suspend fun getClasses(): ApiResult<ArrayList<Class>> {
        val response = api.getClasses()

        if (!response.isSuccessful || response.body().isNullOrEmpty()) {
            return ApiResult.Error(Throwable())
        }

        return try {
            ApiResult.Success(response.body() as ArrayList<Class>)
        } catch (e: Exception) {
            ApiResult.Error(Throwable())
        }
    }
}