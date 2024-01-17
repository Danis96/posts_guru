package com.js.guru

import android.app.Application
import androidx.core.app.NotificationCompat
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent

class AndroidApplication : Application(), LifecycleObserver {
    override fun onCreate() {
        super.onCreate()
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    fun onAppBackgrounded() {
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    fun onAppForeground() {
    }

    companion object {
        private const val STARTING_ACTIVITY = "com.djudjo.scheduler.MainActivity"
    }
}