package com.cr0manty.audio_metadata

import android.media.MediaMetadataRetriever
import android.os.Build
import androidx.annotation.RequiresApi
import java.io.File
import java.lang.Exception
import java.nio.file.Files
import java.nio.file.attribute.BasicFileAttributes


class MetaDataManager {
    companion object {
        fun getMetaData(filePath: String): Map<String, Any?> {
            val result: MutableMap<String, Any?> = HashMap()
            val metaRetriever = MediaMetadataRetriever()
            metaRetriever.setDataSource(filePath);
            try {
                result["album"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
                result["artist"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
                result["genre"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)
                result["album_artist"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
                result["title"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
                result["duration"] = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                result["filename"] = filePath.substringAfterLast("/")

                val file = File(filePath)
                result["size_in_bytes"] = file.length();
                result["creation_date_stamp"] = getLastModifiedTimeInMillis(file)
            } catch (error: Exception) {
                print(error)
            }
            return result


        }

        private fun getLastModifiedTimeInMillis(file: File): Long? {
            return try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    getLastModifiedTimeFromBasicFileAttrs(file)
                } else {
                    file.lastModified()
                }
            } catch (x: Exception) {
                x.printStackTrace()
                null
            }
        }

        @RequiresApi(Build.VERSION_CODES.O)
        private fun getLastModifiedTimeFromBasicFileAttrs(file: File): Long {
            val basicFileAttributes = Files.readAttributes(
                    file.toPath(),
                    BasicFileAttributes::class.java
            )
            return basicFileAttributes.creationTime().toMillis()
        }
    }
}