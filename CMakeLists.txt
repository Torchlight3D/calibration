# ── Torchlight::Calibration ────────────────────────────────────────────────────
# Camera/IMU calibration: intrinsics, extrinsics, stereo, spline trajectory, etc.

# ── Standalone build support ─────────────────────────────────────────────────
if(NOT TORCHLIGHT_SUPERBUILD)
    cmake_minimum_required(VERSION 3.24)
    include(${CMAKE_CURRENT_SOURCE_DIR}/.cmake.conf)
    project(TorchlightCalibration
        VERSION     "${TORCHLIGHT_MODULE_VERSION}"
        DESCRIPTION "Torchlight Calibration module"
        LANGUAGES   CXX C
    )

    include(GNUInstallDirs)
    include(CMakePackageConfigHelpers)

    set(CMAKE_CXX_STANDARD 20)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)

    set(TORCHLIGHT_NAMESPACE "tl" CACHE STRING "CMake namespace")

    if(MSVC)
        add_compile_definitions(_USE_MATH_DEFINES NOMINMAX)
    endif()

    list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../cmake")
    include(TorchlightHelpers)

    option(TORCHLIGHT_BUILD_TESTS "Build unit tests" ON)
    if(TORCHLIGHT_BUILD_TESTS)
        enable_testing()
        include(GoogleTest)
        find_package(GTest CONFIG REQUIRED)
    endif()

    # Standalone: find all required modules
    if(NOT TARGET ${TORCHLIGHT_NAMESPACE}::Core)
        find_package(Torchlight COMPONENTS Core Math Camera Motion Mvs Vision
                     CONFIG REQUIRED)
    endif()
endif()

# ── Dependencies ─────────────────────────────────────────────────────────────
# Sophus: Lie-group library (used in spline trajectory estimator).
find_package(Sophus CONFIG REQUIRED)

# Ceres Solver: nonlinear optimisation.
find_package(Ceres CONFIG REQUIRED)

# yaml-cpp: for IO serialisation.
find_package(yaml-cpp CONFIG REQUIRED)

# OpenCV: calibration routines.
find_package(OpenCV REQUIRED COMPONENTS calib3d)

# ── Module target ────────────────────────────────────────────────────────────
torchlight_add_module(Calibration
    PUBLIC_DEPENDS
        ${TORCHLIGHT_NAMESPACE}::Camera
        ${TORCHLIGHT_NAMESPACE}::Core
        ${TORCHLIGHT_NAMESPACE}::Math
        ${TORCHLIGHT_NAMESPACE}::Motion
        ${TORCHLIGHT_NAMESPACE}::Mvs
        ${TORCHLIGHT_NAMESPACE}::Vision
        Ceres::ceres
        Sophus::Sophus
        yaml-cpp::yaml-cpp
        Graaf::Graaf
        opencv_calib3d
    PRIVATE_DEPENDS
        magic_enum::magic_enum
        nlohmann_json::nlohmann_json
)

# ── Install per-module package config ────────────────────────────────────────
torchlight_install_module_config(Calibration
    CONFIG_FILE "${CMAKE_CURRENT_SOURCE_DIR}/CalibrationConfig.cmake"
)

# ── Generate Qt-style public include tree ────────────────────────────────────
torchlight_generate_headers(Calibration
    MODULE_DIR tCalibration
    HEADERS
        # ── Top-level ────────────────────────────────────────────────
        tl_calibration_global.h

        # ── Calibration tasks ───────────────────────────────────────
        cameraimucalibration.h
        cameraimurotationcalibration.h
        cameraintrinsicscalibration.h
        cameraposecalibration.h
        imuintrinsicscalibration.h
        imunoisecalibration.h
        "initializeintrinsics.h=cameraintrinsicsinitialization.h"
        inertialbasedscaleestimation.h
        splinetrajectoryestimator.h
        stereocameracalibration.h
        stereocameraverification.h
        stereorectify.h

        # ── IO ──────────────────────────────────────────────────────
        "io/io_calib.h=calibrationio.h"
        "io/io_camera.h=cameraio.h"
        "io/io_eigen.h=eigenio.h"
        "io/io_imu.h=imuio.h"

    ALIASES
        "CameraImuCalibration=cameraimucalibration.h"
        "CameraImuRotationCalibration=cameraimurotationcalibration.h"
        "CameraIntrinsicsCalibration=cameraintrinsicscalibration.h"
        "CameraIntrinsicsInitialization=cameraintrinsicsinitialization.h"
        "CameraPoseCalibration=cameraposecalibration.h"
        "CalibrationIO=calibrationio.h"
        "CameraIO=cameraio.h"
        "EigenIO=eigenio.h"
        "ImuIO=imuio.h"
        "ImuIntrinsicsCalibration=imuintrinsicscalibration.h"
        "ImuNoiseCailbration=imunoisecalibration.h"
        "InertialBasedScaleEstimation=inertialbasedscaleestimation.h"
        "SplineTrajectoryEstimator=splinetrajectoryestimator.h"
        "StereoCameraCalibration=stereocameracalibration.h"
        "StereoCameraVerification=stereocameraverification.h"
        "StereoRectify=stereorectify.h"
)
