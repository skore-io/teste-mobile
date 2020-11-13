package com.guioliveiraapps.skore

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.NavController
import androidx.navigation.findNavController

class MainActivity : AppCompatActivity() {

    lateinit var navController: NavController

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportActionBar?.hide()
        navController = findNavController(R.id.navController)

    }

    override fun onBackPressed() {
        if (navController.previousBackStackEntry == null) {
            moveTaskToBack(true)
            return
        }
        super.onBackPressed()
    }
}