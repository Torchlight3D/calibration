torchlight_add_test(calibration_test
    SOURCES
        tst_camintrinsics.cpp
        tst_ibse.cpp
        tst_io.cpp
        # tst_imuintrinsics.cpp — excluded: csv-parser uses std::result_of removed in C++20
        tst_spline.cpp
        # tst_stereo.cpp — excluded: depends on camera composition framework (WIP)
    LINK_LIBRARIES
        ${TORCHLIGHT_NAMESPACE}::Calibration
        GTest::gtest
        GTest::gtest_main
)
