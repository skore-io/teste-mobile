package com.guioliveiraapps.skore

import android.app.Application
import android.content.Context
import androidx.test.runner.AndroidJUnitRunner
import com.guioliveiraapps.skore.app.TestApp

class AppTestRunner : AndroidJUnitRunner() {

    override fun newApplication(
        classLoader: ClassLoader?,
        className: String?,
        context: Context?
    ): Application {
        return super.newApplication(classLoader, TestApp::class.java.name, context)
    }
}