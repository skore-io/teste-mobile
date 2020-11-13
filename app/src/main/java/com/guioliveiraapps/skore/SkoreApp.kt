package com.guioliveiraapps.skore

import android.app.Application
import com.guioliveiraapps.skore.di.coroutineContextProviderModule
import com.guioliveiraapps.skore.di.remoteModule
import com.guioliveiraapps.skore.di.repositoryModule
import com.guioliveiraapps.skore.di.viewModelModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class SkoreApp : Application() {

    override fun onCreate() {
        super.onCreate()
        initKoin()
    }

    private fun initKoin() {
        startKoin {
            androidContext(this@SkoreApp)
            modules(
                listOf(
                    repositoryModule,
                    viewModelModule,
                    remoteModule,
                    coroutineContextProviderModule
                )
            )
        }
    }

}
