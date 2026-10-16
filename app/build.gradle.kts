plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.cheviexplorer.android"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.cheviexplorer.android"
        minSdk = 23
        targetSdk = 28
        versionCode = 1
        versionName = "0.1.0"
    }
}

dependencies {
    implementation("com.github.mik3y:usb-serial-for-android:3.11.0")
}
