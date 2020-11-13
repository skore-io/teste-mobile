package com.guioliveiraapps.skore.main

import android.content.Intent
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.isDisplayed
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.rule.ActivityTestRule
import com.guioliveiraapps.skore.InstrumentalTestContextProvider
import com.guioliveiraapps.skore.MainActivity
import com.guioliveiraapps.skore.R
import com.guioliveiraapps.skore.features.home.HomeFragmentViewModel
import com.guioliveiraapps.skore.features.home.repository.ClassRepository
import com.guioliveiraapps.skore.features.home.repository.MockedClassRepositoryImpl
import com.guioliveiraapps.skore.features.splash.SplashFragmentViewModel
import com.guioliveiraapps.skore.main._util.MockedClassRepositoryErrorImpl
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.delay
import kotlinx.coroutines.test.runBlockingTest
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.context.loadKoinModules
import org.koin.core.context.unloadKoinModules
import org.koin.dsl.module

@ExperimentalCoroutinesApi
@RunWith(AndroidJUnit4::class)
class HomeScreenErrorTest {

    @get:Rule
    val rule = ActivityTestRule(MainActivity::class.java, true, false)

    private val testDispatcher = InstrumentalTestContextProvider()

    private val modules = module {
        single<ClassRepository> { MockedClassRepositoryErrorImpl() }

        viewModel {
            SplashFragmentViewModel(dispatcher = testDispatcher)
        }

        viewModel {
            HomeFragmentViewModel(
                classRepository = get(),
                dispatcher = testDispatcher
            )
        }
    }

    @Before
    fun setUp() {
        loadKoinModules(modules)
        rule.launchActivity(Intent())
    }

    @Test
    fun shouldShowError() {
        testDispatcher.testCoroutineDispatcher.runBlockingTest {
            onView(withId(R.id.logo)).check(matches(isDisplayed()))
            delay(5000)
            onView(withId(R.id.loading)).check(matches(isDisplayed()))
            delay(5000)
            onView(withId(R.id.txtError)).check(matches(isDisplayed()))
        }
    }

    @After
    fun tearDown() {
        unloadKoinModules(modules)
    }

}