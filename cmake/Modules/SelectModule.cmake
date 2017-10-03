macro (SelectModule)
  set(USE_WEBP_DEFAULT ON)
  if(WINRT OR WP8)
    set(USE_WEBP_DEFAULT OFF)
  endif()

  set(USE_PREBUILT_LIBS_DEFAULT ON)
  if(MINGW)
    set(USE_PREBUILT_LIBS_DEFAULT OFF)
  endif()

  set(BUILD_CPP_EMPTY_TEST_DEFAULT OFF)
  set(BUILD_CPP_TESTS_DEFAULT OFF)
  set(BUILD_LUA_LIBS_DEFAULT OFF)
  set(BUILD_LUA_TESTS_DEFAULT OFF)
  set(BUILD_JS_LIBS_DEFAULT OFF)
  set(BUILD_JS_TESTS_DEFAULT OFF)
  # TODO: fix test samples for MSVC
  if(MSVC)
    set(BUILD_CPP_EMPTY_TEST_DEFAULT OFF)
    set(BUILD_CPP_TESTS_DEFAULT OFF)
    set(BUILD_LUA_LIBS_DEFAULT OFF)
    set(BUILD_LUA_TESTS_DEFAULT OFF)
    set(BUILD_JS_LIBS_DEFAULT OFF)
    set(BUILD_JS_TESTS_DEFAULT OFF)
  endif()

  option(USE_CHIPMUNK "Use chipmunk for physics library" ON)
  option(USE_BOX2D "Use box2d for physics library" OFF)
  option(USE_BULLET "Use bullet for physics3d library" ON)
  option(USE_RECAST "Use Recast for navigation mesh" ON)
  option(USE_WEBP "Use WebP codec" ${USE_WEBP_DEFAULT})
  option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
  option(DEBUG_MODE "Debug or release?" ON)
  option(BUILD_EXTENSIONS "Build extension library" ON)
  option(BUILD_EDITOR_SPINE "Build editor support for spine" ON)
  option(BUILD_EDITOR_COCOSTUDIO "Build editor support for cocostudio" ON)
  option(BUILD_EDITOR_COCOSBUILDER "Build editor support for cocosbuilder" ON)
  option(BUILD_BOX2D "Build box2d external without using it for physics library" OFF)
  option(BUILD_CPP_TESTS "Build TestCpp samples" ${BUILD_CPP_TESTS_DEFAULT})
  option(BUILD_CPP_EMPTY_TEST "Build TestCpp samples" ${BUILD_CPP_EMPTY_TEST_DEFAULT})
  option(BUILD_LUA_LIBS "Build lua libraries" ${BUILD_LUA_LIBS_DEFAULT})
  option(BUILD_LUA_TESTS "Build TestLua samples" ${BUILD_LUA_TESTS_DEFAULT})
  option(BUILD_JS_LIBS "Build js libraries" ${BUILD_JS_LIBS_DEFAULT})
  option(BUILD_JS_TESTS "Build TestJS samples" ${BUILD_JS_TESTS_DEFAULT})
  option(USE_PREBUILT_LIBS "Use prebuilt libraries in external directory" ${USE_PREBUILT_LIBS_DEFAULT})
  option(USE_SOURCES_EXTERNAL "Use sources in external directory (automatically ON when USE_PREBUILT_LIBS is ON)" OFF)

  if(USE_PREBUILT_LIBS AND MINGW)
    message(FATAL_ERROR "Prebuilt windows libs can't be used with mingw, please use packages.")
    return()
  endif()

endmacro(SelectModule)