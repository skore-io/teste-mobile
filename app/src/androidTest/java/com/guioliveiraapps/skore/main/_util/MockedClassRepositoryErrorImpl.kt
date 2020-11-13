package com.guioliveiraapps.skore.main._util

import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.model.Class
import kotlinx.coroutines.delay

class MockedClassRepositoryErrorImpl : ClassRepository {
    private val apiDelaySimulationTime = 2000L

    override suspend fun getClasses(): ApiResult<ArrayList<Class>> {
        delay(apiDelaySimulationTime)
        return ApiResult.Error(Throwable())
    }

}