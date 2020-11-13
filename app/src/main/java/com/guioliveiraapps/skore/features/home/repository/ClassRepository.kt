package com.guioliveiraapps.skore.features.home.repository

import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.model.Class

interface ClassRepository {
    suspend fun getClasses(): ApiResult<ArrayList<Class>>
}