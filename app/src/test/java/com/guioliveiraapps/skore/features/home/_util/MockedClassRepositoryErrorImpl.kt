package com.guioliveiraapps.skore.features.home._util

import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.model.Class

class MockedClassRepositoryErrorImpl : ClassRepository {
    override suspend fun getClasses(): ApiResult<ArrayList<Class>> {
        return ApiResult.Error(Throwable())
    }

}