package com.example.micro_front_end_poc


import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.infogird.app/service"
    private val DATABASE_CHANNEL = "com.infogird.app/database"
    private val LOCATION_PERMISSION_REQUEST_CODE = 1001

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Service-related MethodChannel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startService" -> {
                    if (checkLocationPermissions()) {
                        Log.d("MainActivity", "Starting location service")
                        startLocationService()
                        result.success("Service Started")
                    } else {
                        requestLocationPermissions()
                        result.error("PERMISSION_DENIED", "Location permissions not granted", null)
                    }
                }
                "stopService" -> {
                    Log.d("MainActivity", "Stopping location service")
                    stopLocationService()
                    result.success("Service Stopped")
                }
                else -> result.notImplemented()
            }
        }

        // Database-related MethodChannel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DATABASE_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getLocations" -> {
                    Log.d("MainActivity", "Fetching locations from database")
                    val locations = getLocationsFromDatabase()
                    result.success(locations)
                }
                "truncateDb" -> {
                    Log.d("MainActivity", "Truncating database table")
                    val dbHelper = LocationDatabaseHelper(this)
                    dbHelper.truncateTable()
                    result.success("true")
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun startLocationService() {
        Log.d("MainActivity", "Creating intent for LocationService")
        val intent = Intent(this, LocationService::class.java)
        ContextCompat.startForegroundService(this, intent)
        Log.d("MainActivity", "Location service started")
    }

    private fun stopLocationService() {
        Log.d("MainActivity", "Creating intent for LocationService")
        val intent = Intent(this, LocationService::class.java)
        stopService(intent)
        Log.d("MainActivity", "Location service stopped")
    }

    private fun getLocationsFromDatabase(): List<Map<String, Any>> {
        Log.d("MainActivity", "Initializing database helper")
        val dbHelper = LocationDatabaseHelper(this)
        val db = dbHelper.readableDatabase

        Log.d("MainActivity", "Querying database for locations")
        val cursor = db.query(
            LocationDatabaseHelper.TABLE_NAME,
            null,
            null,
            null,
            null,
            null,
            null
        )

        val locations = mutableListOf<Map<String, Any>>()

        while (cursor.moveToNext()) {
            val id = cursor.getLong(cursor.getColumnIndexOrThrow(LocationDatabaseHelper.COLUMN_ID))
            val latitude = cursor.getDouble(cursor.getColumnIndexOrThrow(LocationDatabaseHelper.COLUMN_LATITUDE))
            val longitude = cursor.getDouble(cursor.getColumnIndexOrThrow(LocationDatabaseHelper.COLUMN_LONGITUDE))
            val timestamp = cursor.getString(cursor.getColumnIndexOrThrow(LocationDatabaseHelper.COLUMN_TIMESTAMP))

            val locationMap = mapOf(
                "id" to id,
                "latitude" to latitude,
                "longitude" to longitude,
                "timestamp" to timestamp
            )

            locations.add(locationMap)
        }

        cursor.close()
        Log.d("MainActivity", "Locations fetched from database")
        return locations
    }

    private fun checkLocationPermissions(): Boolean {
        val fineLocationPermission = ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
        val coarseLocationPermission = ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION)
        return fineLocationPermission == PackageManager.PERMISSION_GRANTED &&
                coarseLocationPermission == PackageManager.PERMISSION_GRANTED
    }

    private fun requestLocationPermissions() {
        ActivityCompat.requestPermissions(
            this,
            arrayOf(Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION),
            LOCATION_PERMISSION_REQUEST_CODE
        )
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == LOCATION_PERMISSION_REQUEST_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Log.d("MainActivity", "Location permissions granted")
            } else {
                Log.d("MainActivity", "Location permissions denied")
            }
        }
    }
}


