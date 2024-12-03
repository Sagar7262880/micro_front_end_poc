package com.example.micro_front_end_poc
import android.util.Log
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.location.Location
import android.os.Build
import android.os.IBinder
import android.os.Looper
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*

class LocationService : Service() {

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationRequest: LocationRequest

    private val locationCallback = object : LocationCallback() {
        override fun onLocationResult(locationResult: LocationResult) {
            Log.d("LocationService", "Location result received")
            locationResult.locations.forEach { location ->
                Log.d("LocationService", "Location received: (${location.latitude}, ${location.longitude})")
                saveLocationToDatabase(location)
            }
        }
    }

    override fun onCreate() {
        super.onCreate()
        Log.d("LocationService", "Service created")
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 5000) //  60000
            .setMinUpdateIntervalMillis(5000)
            .build()
        startForegroundService()
        // checkLocationSettings()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        Log.d("LocationService", "Starting location updates")
        startLocationUpdates()
        return START_STICKY
    }

    private fun startLocationUpdates() {
        Log.d("LocationService", "Requesting location updates")
        fusedLocationClient.requestLocationUpdates(
            locationRequest, locationCallback, Looper.getMainLooper()
        ).addOnSuccessListener {
            Log.d("LocationService", "Location updates requested successfully")
        }.addOnFailureListener { e ->
            Log.e("LocationService", "Failed to request location updates", e)
        }
    }

    private fun saveLocationToDatabase(location: Location) {
        val latitude = location.latitude
        val longitude = location.longitude
        // val timestamp = System.currentTimeMillis().toString()
        val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault())
        val timestamp: String = dateFormat.format(Date())
        Log.d("LocationService", "Saving location to database: ($latitude, $longitude) at $timestamp")
        val dbHelper = LocationDatabaseHelper(this)
        val result = dbHelper.insertLocation(latitude, longitude, timestamp)

        if (result != -1L) {
            Log.d("LocationService", "Location saved to database successfully")
        } else {
            Log.d("LocationService", "Failed to save location to database")
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("LocationService", "Service destroyed")
        fusedLocationClient.removeLocationUpdates(locationCallback)
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun startForegroundService() {
        val channelId = "location_service_channel"
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Location Service Channel",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(channel)
        }

        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setContentTitle("Location Service")
            .setContentText("Tracking location in the background")
            // .setSmallIcon(R.drawable.ic_location) // Use your own icon here
            .setPriority(NotificationCompat.PRIORITY_DEFAULT)

        startForeground(NOTIFICATION_ID, notificationBuilder.build())
        Log.d("LocationService", "Foreground service started")
    }

    companion object {
        private const val NOTIFICATION_ID = 1234
    }

    
}
