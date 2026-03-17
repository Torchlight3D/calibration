# Torchlight::Calibration — per-module package configuration
# Imported by TorchlightConfig.cmake or usable standalone.

include(CMakeFindDependencyMacro)

# Calibration depends on Camera, Core, Math, Motion, Mvs, Vision
include("${CMAKE_CURRENT_LIST_DIR}/CameraConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/CoreConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/MathConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/MotionConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/MvsConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/VisionConfig.cmake")

# Calibration's public dependencies
find_dependency(Ceres CONFIG)
find_dependency(Sophus CONFIG)
find_dependency(yaml-cpp CONFIG)
find_dependency(OpenCV COMPONENTS calib3d)

if(NOT TARGET tl::Calibration)
    include("${CMAKE_CURRENT_LIST_DIR}/CalibrationTargets.cmake")
endif()
