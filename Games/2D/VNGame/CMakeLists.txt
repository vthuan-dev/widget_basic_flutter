cmake_minimum_required(VERSION 3.8)
set(APP_NAME MyGame)
project()

include(cocos2d/cmake/Cocos2dX.cmake)

set(GAME_SOURCE
    Classes/AppDelegate.cpp
    Classes/GameScene.cpp
    Classes/Player.cpp
    Classes/Enemy.cpp
)

set(GAME_HEADERS
    Classes/AppDelegate.h
    Classes/GameScene.h
    Classes/Player.h
    Classes/Enemy.h
)

cocos_build_app(
    APP_NAME ${APP_NAME}
    APP_SRC ${GAME_SOURCE}
    APP_HEADERS ${GAME_HEADERS}
    DEPEND_COMMON_LIBS
    DEPEND_ANDROID_LIBS
)

if(XCODE OR VS)
    cocos_mark_code_files("${APP_NAME}")
endif()
