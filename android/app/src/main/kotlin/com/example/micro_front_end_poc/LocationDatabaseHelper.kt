package com.example.micro_front_end_poc
import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class LocationDatabaseHelper(context: Context) : SQLiteOpenHelper(
    context, DATABASE_NAME, null, DATABASE_VERSION
) {

    // Constants for table and column names
    companion object {
        private const val DATABASE_VERSION = 1
        private const val DATABASE_NAME = "location.db"
        const val TABLE_NAME = "locations"
        const val COLUMN_ID = "id"
        const val COLUMN_LATITUDE = "latitude"
        const val COLUMN_LONGITUDE = "longitude"
        const val COLUMN_TIMESTAMP = "timestamp"
    }

    override fun onCreate(db: SQLiteDatabase) {
        val createTable = """
            CREATE TABLE $TABLE_NAME (
                $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                $COLUMN_LATITUDE REAL,
                $COLUMN_LONGITUDE REAL,
                $COLUMN_TIMESTAMP TEXT
            )
        """
        db.execSQL(createTable)
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS $TABLE_NAME")
        onCreate(db)
    }

    fun insertLocation(latitude: Double, longitude: Double, timestamp: String): Long {
        val values = ContentValues().apply {
            put(COLUMN_LATITUDE, latitude)
            put(COLUMN_LONGITUDE, longitude)
            put(COLUMN_TIMESTAMP, timestamp)
        }
        return writableDatabase.insert(TABLE_NAME, null, values)
    }
    fun truncateTable() {
        writableDatabase.execSQL("DELETE FROM $TABLE_NAME")
        writableDatabase.execSQL("VACUUM") // Optionally reclaim database file space
    }
    
}
