licenses(["notice"])  # Apache 2

load("@envoy//bazel:envoy_build_system.bzl", "envoy_package")
load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kt_android_library")
load("//bazel:aar_with_jni.bzl", "aar_with_jni")

envoy_package()

aar_with_jni(
    name = "android_aar",
    android_library = "//library:android_lib",
    archive_name = "envoy",
    visibility = ["//visibility:public"],
)

# Android library drops exported dependencies from dependent rules. The kt_android_library
#  internally is just a macro which wraps two rules into one:
#  https://github.com/bazelbuild/rules_kotlin/blob/326661e7e705d14e754abc2765837aa61bddf205/kotlin/internal/jvm/android.bzl#L28.
#  This causes the sources to be exported and dropped due to it being a transitive dependency.
#  To get around this, we have to redeclare the sources from envoy_engine_lib here in order to be pulled into the
#  kotlin jar.
kt_android_library(
    name = "android_lib",
    srcs = [
        "java/io/envoyproxy/envoymobile/engine/EnvoyEngine.java",
        "kotlin/io/envoyproxy/envoymobile/Envoy.kt",
    ],
    custom_package = "io.envoyproxy.envoymobile",
    manifest = "kotlin/io/envoyproxy/envoymobile/EnvoyManifest.xml",
    visibility = ["//visibility:public"],
    deps = ["envoy_engine_lib"],
)

android_library(
    name = "envoy_engine_lib",
    srcs = ["java/io/envoyproxy/envoymobile/engine/EnvoyEngine.java"],
    custom_package = "io.envoyproxy.envoymobile.engine",
    manifest = "java/io/envoyproxy/envoymobile/engine/EnvoyEngineManifest.xml",
    visibility = ["//visibility:public"],
    deps = ["//library/common:envoy_jni_interface_lib"],
)