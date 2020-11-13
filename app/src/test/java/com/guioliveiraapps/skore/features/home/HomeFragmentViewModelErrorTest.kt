package com.guioliveiraapps.skore.features.home

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import com.guioliveiraapps.skore.TestContextProvider
import com.guioliveiraapps.skore.features.home._util.MockedClassRepositoryErrorImpl
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.util.ScreenState
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runBlockingTest
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.context.startKoin
import org.koin.core.context.unloadKoinModules
import org.koin.dsl.module
import org.koin.test.KoinTest
import org.koin.test.inject

@ExperimentalCoroutinesApi
class HomeFragmentViewModelErrorTest : KoinTest {

    private val homeFragmentViewModel: HomeFragmentViewModel by inject()
    private val testDispatcher = TestContextProvider()

    @get:Rule
    val instantTestExecutorRule = InstantTaskExecutorRule()

    private val module = module {
        single<ClassRepository> { MockedClassRepositoryErrorImpl() }

        viewModel {
            HomeFragmentViewModel(
                classRepository = get(),
                dispatcher = testDispatcher
            )
        }
    }

    @Before
    fun setUp() {
        startKoin {
            modules(module)
        }
    }

    @Test
    fun `error test`() {
        assert(homeFragmentViewModel.screenState.value is ScreenState.Loading)

        testDispatcher.testCoroutineDispatcher.runBlockingTest {
            homeFragmentViewModel.getClasses()
        }

        assert(homeFragmentViewModel.screenState.value is ScreenState.Error)
    }

    @After
    fun tearDown() {
        unloadKoinModules(module)
    }

}