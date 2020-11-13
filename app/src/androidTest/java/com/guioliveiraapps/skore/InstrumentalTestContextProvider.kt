package com.guioliveiraapps.skore

import com.guioliveiraapps.skore.util.CoroutineContextProvider
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.TestCoroutineDispatcher
import kotlin.coroutines.CoroutineContext

@ExperimentalCoroutinesApi
class InstrumentalTestContextProvider : CoroutineContextProvider() {
    val testCoroutineDispatcher = TestCoroutineDispatcher()

    override val Main: CoroutineContext = testCoroutineDispatcher
    override val IO: CoroutineContext = testCoroutineDispatcher
}