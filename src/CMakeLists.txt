# ── Calibration module sources ────────────────────────────────────────────────
# Every header (.h/.hpp) and source (.cpp) file is listed explicitly.
# This file is included by torchlight_add_module() via add_subdirectory(src).

target_sources(Calibration
    PRIVATE
        # ── Top-level ───────────────────────────────────────────────────
        tl_calibration_global.h
        calibobservation.h
        calibobservation.cpp
        cameraimucalibration.h
        cameraimucalibration.cpp
        cameraimurotationcalibration.h
        cameraimurotationcalibration.cpp
        cameraintrinsicscalibration.h
        cameraintrinsicscalibration.cpp
        cameraposecalibration.h
        cameraposecalibration.cpp
        ceressplinehelper.hpp
        ceressplineresiduals.hpp
        imucalibrationtask.h
        imucalibrationtask.cpp
        imuintrinsicscalibration.h
        imuintrinsicscalibration.cpp
        imunoisecalibration.h
        imunoisecalibration.cpp
        inertialbasedscaleestimation.h
        inertialbasedscaleestimation.cpp
        initializeintrinsics.h
        initializeintrinsics.cpp
        splinefactors.h
        splinetrajectoryestimator.h
        stereocameracalibration.h
        stereocameracalibration.cpp
        # stereocameraverification: excluded - depends on camera composition framework (WIP)
        # stereorectify: excluded - needs OpenCV contrib (ccalib)
        util_scene.h
        util_scene.cpp

        # ── IO ──────────────────────────────────────────────────────────
        io/io_calib.h
        io/io_calib.cpp
        io/io_camera.h
        io/io_camera.cpp
        io/io_eigen.h
        io/io_eigen.cpp
        io/io_imu.h
        io/io_imu.cpp

        # ── MCMB ───────────────────────────────────────────────────────
        mcmb/board.h
        mcmb/board.cpp
        mcmb/boardgroup.h
        mcmb/boardgroup.cpp
        mcmb/boardgroupobs.h
        mcmb/boardgroupobs.cpp
        mcmb/boardobs.h
        mcmb/boardobs.cpp
        mcmb/calibration.h
        mcmb/calibration.cpp
        mcmb/camera.h
        mcmb/camera.cpp
        mcmb/cameragroup.h
        mcmb/cameragroup.cpp
        mcmb/cameragroupobs.h
        mcmb/cameragroupobs.cpp
        mcmb/cameraobs.h
        mcmb/cameraobs.cpp
        mcmb/factors.h
        mcmb/frame.h
        mcmb/frame.cpp
        mcmb/systemgraph.h
        mcmb/systemgraph.cpp
        mcmb/utils.h
        mcmb/utils.cpp
)