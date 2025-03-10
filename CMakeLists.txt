cmake_minimum_required(VERSION 3.16)

project(InfotainmentSystem-UI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON) # MUST BE ADDED MANUALLY
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appInfotainmentSystem-UI
    main.cpp
)

qt_add_qml_module(appInfotainmentSystem-UI
    URI InfotainmentSystem-UI
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES qrc.qrc
        SOURCES Controllers/system.h Controllers/system.cpp
        SOURCES Controllers/hvachandler.h Controllers/hvachandler.cpp
        SOURCES Controllers/lightcontrol.h Controllers/lightcontrol.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appInfotainmentSystem-UI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appInfotainmentSystem-UI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appInfotainmentSystem-UI
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appInfotainmentSystem-UI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
