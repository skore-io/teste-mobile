package com.guioliveiraapps.skore.di

import com.guioliveiraapps.skore.api.Api
import com.guioliveiraapps.skore.features.home.HomeFragmentViewModel
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.features.home.repository.MockedClassRepositoryImpl
import com.guioliveiraapps.skore.features.splash.SplashFragmentViewModel
import com.guioliveiraapps.skore.util.CoroutineContextProvider
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val repositoryModule = module {
//    single<ClassRepository> { ClassRepositoryImpl(api = get()) }
    single<ClassRepository> { MockedClassRepositoryImpl() }
}

val remoteModule = module {
    single { provideOkHttpClient() }
    single { provideRetrofit(get()) }
    single { createApi<Api>(get()) }
}

val viewModelModule = module {
    viewModel {
        SplashFragmentViewModel(dispatcher = get())
    }

    viewModel {
        HomeFragmentViewModel(classRepository = get(), dispatcher = get())
    }
}

val coroutineContextProviderModule = module {
    single { CoroutineContextProvider() }
}
