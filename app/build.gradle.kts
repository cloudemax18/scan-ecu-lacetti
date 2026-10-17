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
        targetSdk = 35
        versionCode = providers.environmentVariable("GITHUB_RUN_NUMBER").orNull?.toIntOrNull() ?: 1
        versionName = providers.environmentVariable("GITHUB_REF_NAME").orNull
            ?.takeIf { it.startsWith("v") && it.length > 1 }
            ?.removePrefix("v")
            ?: "0.1.0-dev.${providers.environmentVariable("GITHUB_RUN_NUMBER").orNull ?: "local"}"
    }

    signingConfigs {
        create("release") {
            val keystorePath = System.getenv("ANDROID_KEYSTORE_FILE")
            if (!keystorePath.isNullOrBlank()) {
                storeFile = file(keystorePath)
                storePassword = System.getenv("ANDROID_KEYSTORE_PASSWORD")
                keyAlias = System.getenv("ANDROID_KEY_ALIAS")
                keyPassword = System.getenv("ANDROID_KEY_PASSWORD")
            }
        }
    }

    buildTypes {
        getByName("debug") {
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-debug"
        }
        getByName("release") {
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("release")
        }
    }

    buildFeatures {
        buildConfig = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

configurations.configureEach {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.jetbrains.kotlin" &&
            requested.name.startsWith("kotlin-stdlib")) {
            useVersion("2.0.21")
            because("Keep Kotlin standard library metadata compatible with Kotlin compiler 2.0.21")
        }
    }
}

dependencies {
    implementation("androidx.core:core:1.15.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.9.0")
    implementation("com.github.mik3y:usb-serial-for-android:3.11.0")
    testImplementation("junit:junit:4.13.2")
}
