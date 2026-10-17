package com.cheviexplorer.android

import org.json.JSONObject
import java.io.File
import java.net.HttpURLConnection
import java.net.URL

internal object GitHubDistribution {
    private const val REPOSITORY = "cloudemax18/scan-ecu-lacetti"
    private const val USER_AGENT = "CheviExplorer-Android"

    data class ReleaseInfo(
        val tagName: String,
        val pageUrl: String,
        val apkUrl: String
    )

    fun fetchLatestRelease(): ReleaseInfo {
        val connection = (URL("https://api.github.com/repos/$REPOSITORY/releases/latest").openConnection() as HttpURLConnection)
        connection.requestMethod = "GET"
        connection.connectTimeout = 10000
        connection.readTimeout = 15000
        connection.setRequestProperty("Accept", "application/vnd.github+json")
        connection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28")
        connection.setRequestProperty("User-Agent", USER_AGENT)
        try {
            val code = connection.responseCode
            val body = (if (code in 200..299) connection.inputStream else connection.errorStream)
                ?.bufferedReader(Charsets.UTF_8)?.use { it.readText() }.orEmpty()
            if (code !in 200..299) throw IllegalStateException("GitHub API HTTP $code: ${body.take(240)}")
            val json = JSONObject(body)
            val assets = json.optJSONArray("assets") ?: throw IllegalStateException("Release sin assets")
            var apkUrl: String? = null
            for (i in 0 until assets.length()) {
                val asset = assets.getJSONObject(i)
                if (asset.optString("name") == "CheviExplorer-release.apk") {
                    apkUrl = asset.optString("browser_download_url").takeIf { it.startsWith("https://") }
                    break
                }
            }
            return ReleaseInfo(
                tagName = json.optString("tag_name"),
                pageUrl = json.optString("html_url"),
                apkUrl = apkUrl ?: throw IllegalStateException("El release no contiene CheviExplorer-release.apk")
            )
        } finally {
            connection.disconnect()
        }
    }

    fun fetchLatestSuccessfulDebugBuild(): String {
        val url = URL("https://api.github.com/repos/$REPOSITORY/actions/workflows/android.yml/runs?branch=main&status=success&per_page=1")
        val connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.connectTimeout = 10000
        connection.readTimeout = 15000
        connection.setRequestProperty("Accept", "application/vnd.github+json")
        connection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28")
        connection.setRequestProperty("User-Agent", USER_AGENT)
        try {
            val code = connection.responseCode
            val body = (if (code in 200..299) connection.inputStream else connection.errorStream)
                ?.bufferedReader(Charsets.UTF_8)?.use { it.readText() }.orEmpty()
            if (code !in 200..299) throw IllegalStateException("GitHub Actions HTTP $code: ${body.take(240)}")
            val runs = JSONObject(body).optJSONArray("workflow_runs")
                ?: throw IllegalStateException("GitHub no devolvió ejecuciones de Actions")
            if (runs.length() == 0) throw IllegalStateException("No hay compilaciones debug exitosas disponibles")
            val run = runs.getJSONObject(0)
            return run.optString("html_url")
                .takeIf { it.startsWith("https://github.com/") }
                ?: throw IllegalStateException("GitHub no devolvió el enlace de la compilación")
        } finally {
            connection.disconnect()
        }
    }

    fun downloadApk(downloadUrl: String, destination: File) {
        require(downloadUrl.startsWith("https://github.com/")) { "URL de descarga no confiable." }
        destination.parentFile?.mkdirs()
        val connection = (URL(downloadUrl).openConnection() as HttpURLConnection)
        connection.instanceFollowRedirects = true
        connection.connectTimeout = 15000
        connection.readTimeout = 30000
        connection.setRequestProperty("User-Agent", USER_AGENT)
        try {
            val code = connection.responseCode
            if (code !in 200..299) throw IllegalStateException("Descarga del APK falló: HTTP $code")
            val maxBytes = 80L * 1024L * 1024L
            connection.inputStream.use { input ->
                destination.outputStream().use { output ->
                    val buffer = ByteArray(8192)
                    var total = 0L
                    while (true) {
                        val count = input.read(buffer)
                        if (count < 0) break
                        total += count
                        if (total > maxBytes) throw IllegalStateException("El APK supera el límite de 80 MB.")
                        output.write(buffer, 0, count)
                    }
                }
            }
            if (destination.length() < 1024L) throw IllegalStateException("El archivo descargado parece incompleto.")
        } catch (e: Exception) {
            destination.delete()
            throw e
        } finally {
            connection.disconnect()
        }
    }
}
