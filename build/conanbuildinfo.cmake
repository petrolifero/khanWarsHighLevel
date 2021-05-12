include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  QT
#################
set(CONAN_QT_ROOT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0")
set(CONAN_INCLUDE_DIRS_QT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtNetwork"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtSql"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtTest"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtPrintSupport"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtOpenGLWidgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtWidgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtOpenGL"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtGui"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtDBus"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtConcurrent"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtXml"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtCore")
set(CONAN_LIB_DIRS_QT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/res/archdatadir/plugins/sqldrivers")
set(CONAN_BIN_DIRS_QT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/bin")
set(CONAN_RES_DIRS_QT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/res")
set(CONAN_SRC_DIRS_QT )
set(CONAN_BUILD_DIRS_QT "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6Widgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6DBus"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6Core")
set(CONAN_FRAMEWORK_DIRS_QT )
set(CONAN_LIBS_QT qsqlite qsqlpsql qsqlodbc Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6DBus Qt6Concurrent Qt6Xml Qt6Core Qt6Core_qobject)
set(CONAN_PKG_LIBS_QT qsqlite qsqlpsql qsqlodbc Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6DBus Qt6Concurrent Qt6Xml Qt6Core Qt6Core_qobject)
set(CONAN_SYSTEM_LIBS_QT )
set(CONAN_FRAMEWORKS_QT )
set(CONAN_FRAMEWORKS_FOUND_QT "")  # Will be filled later
set(CONAN_DEFINES_QT "-DQT_NETWORK_LIB"
			"-DQT_SQL_LIB"
			"-DQT_TEST_LIB"
			"-DQT_PRINTSUPPORT_LIB"
			"-DQT_OPENGLWIDGETS_LIB"
			"-DQT_WIDGETS_LIB"
			"-DQT_OPENGL_LIB"
			"-DQT_GUI_LIB"
			"-DQT_DBUS_LIB"
			"-DQT_CONCURRENT_LIB"
			"-DQT_XML_LIB"
			"-DQT_CORE_LIB")
set(CONAN_BUILD_MODULES_PATHS_QT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_QT "QT_NETWORK_LIB"
			"QT_SQL_LIB"
			"QT_TEST_LIB"
			"QT_PRINTSUPPORT_LIB"
			"QT_OPENGLWIDGETS_LIB"
			"QT_WIDGETS_LIB"
			"QT_OPENGL_LIB"
			"QT_GUI_LIB"
			"QT_DBUS_LIB"
			"QT_CONCURRENT_LIB"
			"QT_XML_LIB"
			"QT_CORE_LIB")

set(CONAN_C_FLAGS_QT "")
set(CONAN_CXX_FLAGS_QT "")
set(CONAN_SHARED_LINKER_FLAGS_QT "")
set(CONAN_EXE_LINKER_FLAGS_QT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_QT_LIST "")
set(CONAN_CXX_FLAGS_QT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_QT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_QT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_QT "${CONAN_FRAMEWORKS_QT}" "_QT" "")
# Append to aggregated values variable
set(CONAN_LIBS_QT ${CONAN_PKG_LIBS_QT} ${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT})


#################
###  OPENSSL
#################
set(CONAN_OPENSSL_ROOT "/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_OPENSSL "/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(CONAN_LIB_DIRS_OPENSSL "/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_OPENSSL "/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/bin")
set(CONAN_RES_DIRS_OPENSSL )
set(CONAN_SRC_DIRS_OPENSSL )
set(CONAN_BUILD_DIRS_OPENSSL "/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_OPENSSL )
set(CONAN_LIBS_OPENSSL ssl crypto)
set(CONAN_PKG_LIBS_OPENSSL ssl crypto)
set(CONAN_SYSTEM_LIBS_OPENSSL dl pthread rt)
set(CONAN_FRAMEWORKS_OPENSSL )
set(CONAN_FRAMEWORKS_FOUND_OPENSSL "")  # Will be filled later
set(CONAN_DEFINES_OPENSSL )
set(CONAN_BUILD_MODULES_PATHS_OPENSSL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENSSL )

set(CONAN_C_FLAGS_OPENSSL "")
set(CONAN_CXX_FLAGS_OPENSSL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENSSL_LIST "")
set(CONAN_CXX_FLAGS_OPENSSL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENSSL "${CONAN_FRAMEWORKS_OPENSSL}" "_OPENSSL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENSSL ${CONAN_PKG_LIBS_OPENSSL} ${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL})


#################
###  PCRE2
#################
set(CONAN_PCRE2_ROOT "/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44")
set(CONAN_INCLUDE_DIRS_PCRE2 "/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/include")
set(CONAN_LIB_DIRS_PCRE2 "/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/lib")
set(CONAN_BIN_DIRS_PCRE2 "/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/bin")
set(CONAN_RES_DIRS_PCRE2 )
set(CONAN_SRC_DIRS_PCRE2 )
set(CONAN_BUILD_DIRS_PCRE2 "/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/")
set(CONAN_FRAMEWORK_DIRS_PCRE2 )
set(CONAN_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_PKG_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_SYSTEM_LIBS_PCRE2 )
set(CONAN_FRAMEWORKS_PCRE2 )
set(CONAN_FRAMEWORKS_FOUND_PCRE2 "")  # Will be filled later
set(CONAN_DEFINES_PCRE2 "-DPCRE2_STATIC")
set(CONAN_BUILD_MODULES_PATHS_PCRE2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE2 "PCRE2_STATIC")

set(CONAN_C_FLAGS_PCRE2 "")
set(CONAN_CXX_FLAGS_PCRE2 "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2 "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE2_LIST "")
set(CONAN_CXX_FLAGS_PCRE2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE2 "${CONAN_FRAMEWORKS_PCRE2}" "_PCRE2" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE2 ${CONAN_PKG_LIBS_PCRE2} ${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2})


#################
###  DOUBLE-CONVERSION
#################
set(CONAN_DOUBLE-CONVERSION_ROOT "/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56")
set(CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION "/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/include")
set(CONAN_LIB_DIRS_DOUBLE-CONVERSION "/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/lib")
set(CONAN_BIN_DIRS_DOUBLE-CONVERSION )
set(CONAN_RES_DIRS_DOUBLE-CONVERSION )
set(CONAN_SRC_DIRS_DOUBLE-CONVERSION )
set(CONAN_BUILD_DIRS_DOUBLE-CONVERSION "/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/")
set(CONAN_FRAMEWORK_DIRS_DOUBLE-CONVERSION )
set(CONAN_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_PKG_LIBS_DOUBLE-CONVERSION double-conversion)
set(CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_DOUBLE-CONVERSION )
set(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "")  # Will be filled later
set(CONAN_DEFINES_DOUBLE-CONVERSION )
set(CONAN_BUILD_MODULES_PATHS_DOUBLE-CONVERSION )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION )

set(CONAN_C_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION "${CONAN_FRAMEWORKS_DOUBLE-CONVERSION}" "_DOUBLE-CONVERSION" "")
# Append to aggregated values variable
set(CONAN_LIBS_DOUBLE-CONVERSION ${CONAN_PKG_LIBS_DOUBLE-CONVERSION} ${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION})


#################
###  FONTCONFIG
#################
set(CONAN_FONTCONFIG_ROOT "/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b")
set(CONAN_INCLUDE_DIRS_FONTCONFIG "/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/include")
set(CONAN_LIB_DIRS_FONTCONFIG "/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/lib")
set(CONAN_BIN_DIRS_FONTCONFIG "/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/bin")
set(CONAN_RES_DIRS_FONTCONFIG )
set(CONAN_SRC_DIRS_FONTCONFIG )
set(CONAN_BUILD_DIRS_FONTCONFIG "/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/")
set(CONAN_FRAMEWORK_DIRS_FONTCONFIG )
set(CONAN_LIBS_FONTCONFIG fontconfig)
set(CONAN_PKG_LIBS_FONTCONFIG fontconfig)
set(CONAN_SYSTEM_LIBS_FONTCONFIG m pthread)
set(CONAN_FRAMEWORKS_FONTCONFIG )
set(CONAN_FRAMEWORKS_FOUND_FONTCONFIG "")  # Will be filled later
set(CONAN_DEFINES_FONTCONFIG )
set(CONAN_BUILD_MODULES_PATHS_FONTCONFIG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FONTCONFIG )

set(CONAN_C_FLAGS_FONTCONFIG "")
set(CONAN_CXX_FLAGS_FONTCONFIG "")
set(CONAN_SHARED_LINKER_FLAGS_FONTCONFIG "")
set(CONAN_EXE_LINKER_FLAGS_FONTCONFIG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FONTCONFIG_LIST "")
set(CONAN_CXX_FLAGS_FONTCONFIG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FONTCONFIG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FONTCONFIG "${CONAN_FRAMEWORKS_FONTCONFIG}" "_FONTCONFIG" "")
# Append to aggregated values variable
set(CONAN_LIBS_FONTCONFIG ${CONAN_PKG_LIBS_FONTCONFIG} ${CONAN_SYSTEM_LIBS_FONTCONFIG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG})


#################
###  ICU
#################
set(CONAN_ICU_ROOT "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a")
set(CONAN_INCLUDE_DIRS_ICU "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/include")
set(CONAN_LIB_DIRS_ICU "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/lib")
set(CONAN_BIN_DIRS_ICU "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/bin")
set(CONAN_RES_DIRS_ICU "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/res")
set(CONAN_SRC_DIRS_ICU )
set(CONAN_BUILD_DIRS_ICU "/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/")
set(CONAN_FRAMEWORK_DIRS_ICU )
set(CONAN_LIBS_ICU icuio icutest icutu icui18n icuuc icudata)
set(CONAN_PKG_LIBS_ICU icuio icutest icutu icui18n icuuc icudata)
set(CONAN_SYSTEM_LIBS_ICU pthread m dl stdc++)
set(CONAN_FRAMEWORKS_ICU )
set(CONAN_FRAMEWORKS_FOUND_ICU "")  # Will be filled later
set(CONAN_DEFINES_ICU "-DU_STATIC_IMPLEMENTATION")
set(CONAN_BUILD_MODULES_PATHS_ICU )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ICU "U_STATIC_IMPLEMENTATION")

set(CONAN_C_FLAGS_ICU "")
set(CONAN_CXX_FLAGS_ICU "")
set(CONAN_SHARED_LINKER_FLAGS_ICU "")
set(CONAN_EXE_LINKER_FLAGS_ICU "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ICU_LIST "")
set(CONAN_CXX_FLAGS_ICU_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ICU_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ICU_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ICU "${CONAN_FRAMEWORKS_ICU}" "_ICU" "")
# Append to aggregated values variable
set(CONAN_LIBS_ICU ${CONAN_PKG_LIBS_ICU} ${CONAN_SYSTEM_LIBS_ICU} ${CONAN_FRAMEWORKS_FOUND_ICU})


#################
###  SQLITE3
#################
set(CONAN_SQLITE3_ROOT "/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b")
set(CONAN_INCLUDE_DIRS_SQLITE3 "/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/include")
set(CONAN_LIB_DIRS_SQLITE3 "/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/lib")
set(CONAN_BIN_DIRS_SQLITE3 "/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/bin")
set(CONAN_RES_DIRS_SQLITE3 )
set(CONAN_SRC_DIRS_SQLITE3 )
set(CONAN_BUILD_DIRS_SQLITE3 "/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_SQLITE3 )
set(CONAN_LIBS_SQLITE3 sqlite3)
set(CONAN_PKG_LIBS_SQLITE3 sqlite3)
set(CONAN_SYSTEM_LIBS_SQLITE3 pthread dl m)
set(CONAN_FRAMEWORKS_SQLITE3 )
set(CONAN_FRAMEWORKS_FOUND_SQLITE3 "")  # Will be filled later
set(CONAN_DEFINES_SQLITE3 )
set(CONAN_BUILD_MODULES_PATHS_SQLITE3 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE3 )

set(CONAN_C_FLAGS_SQLITE3 "")
set(CONAN_CXX_FLAGS_SQLITE3 "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3 "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE3_LIST "")
set(CONAN_CXX_FLAGS_SQLITE3_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE3 "${CONAN_FRAMEWORKS_SQLITE3}" "_SQLITE3" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE3 ${CONAN_PKG_LIBS_SQLITE3} ${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3})


#################
###  LIBPQ
#################
set(CONAN_LIBPQ_ROOT "/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d")
set(CONAN_INCLUDE_DIRS_LIBPQ "/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/include")
set(CONAN_LIB_DIRS_LIBPQ "/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/lib")
set(CONAN_BIN_DIRS_LIBPQ "/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/bin")
set(CONAN_RES_DIRS_LIBPQ )
set(CONAN_SRC_DIRS_LIBPQ )
set(CONAN_BUILD_DIRS_LIBPQ "/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/")
set(CONAN_FRAMEWORK_DIRS_LIBPQ )
set(CONAN_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_PKG_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_SYSTEM_LIBS_LIBPQ pthread)
set(CONAN_FRAMEWORKS_LIBPQ )
set(CONAN_FRAMEWORKS_FOUND_LIBPQ "")  # Will be filled later
set(CONAN_DEFINES_LIBPQ )
set(CONAN_BUILD_MODULES_PATHS_LIBPQ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPQ )

set(CONAN_C_FLAGS_LIBPQ "")
set(CONAN_CXX_FLAGS_LIBPQ "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPQ_LIST "")
set(CONAN_CXX_FLAGS_LIBPQ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPQ "${CONAN_FRAMEWORKS_LIBPQ}" "_LIBPQ" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPQ ${CONAN_PKG_LIBS_LIBPQ} ${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ})


#################
###  ODBC
#################
set(CONAN_ODBC_ROOT "/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea")
set(CONAN_INCLUDE_DIRS_ODBC "/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/include")
set(CONAN_LIB_DIRS_ODBC "/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/lib")
set(CONAN_BIN_DIRS_ODBC "/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/bin")
set(CONAN_RES_DIRS_ODBC )
set(CONAN_SRC_DIRS_ODBC )
set(CONAN_BUILD_DIRS_ODBC "/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/")
set(CONAN_FRAMEWORK_DIRS_ODBC )
set(CONAN_LIBS_ODBC odbc odbcinst odbccr ltdl)
set(CONAN_PKG_LIBS_ODBC odbc odbcinst odbccr ltdl)
set(CONAN_SYSTEM_LIBS_ODBC pthread dl)
set(CONAN_FRAMEWORKS_ODBC )
set(CONAN_FRAMEWORKS_FOUND_ODBC "")  # Will be filled later
set(CONAN_DEFINES_ODBC )
set(CONAN_BUILD_MODULES_PATHS_ODBC )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ODBC )

set(CONAN_C_FLAGS_ODBC "")
set(CONAN_CXX_FLAGS_ODBC "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC "")
set(CONAN_EXE_LINKER_FLAGS_ODBC "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ODBC_LIST "")
set(CONAN_CXX_FLAGS_ODBC_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ODBC_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ODBC_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ODBC "${CONAN_FRAMEWORKS_ODBC}" "_ODBC" "")
# Append to aggregated values variable
set(CONAN_LIBS_ODBC ${CONAN_PKG_LIBS_ODBC} ${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC})


#################
###  XKBCOMMON
#################
set(CONAN_XKBCOMMON_ROOT "/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c")
set(CONAN_INCLUDE_DIRS_XKBCOMMON "/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/include")
set(CONAN_LIB_DIRS_XKBCOMMON "/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/lib")
set(CONAN_BIN_DIRS_XKBCOMMON "/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/bin")
set(CONAN_RES_DIRS_XKBCOMMON )
set(CONAN_SRC_DIRS_XKBCOMMON )
set(CONAN_BUILD_DIRS_XKBCOMMON "/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/")
set(CONAN_FRAMEWORK_DIRS_XKBCOMMON )
set(CONAN_LIBS_XKBCOMMON xkbcommon-x11 xkbcommon xkbregistry)
set(CONAN_PKG_LIBS_XKBCOMMON xkbcommon-x11 xkbcommon xkbregistry)
set(CONAN_SYSTEM_LIBS_XKBCOMMON )
set(CONAN_FRAMEWORKS_XKBCOMMON )
set(CONAN_FRAMEWORKS_FOUND_XKBCOMMON "")  # Will be filled later
set(CONAN_DEFINES_XKBCOMMON )
set(CONAN_BUILD_MODULES_PATHS_XKBCOMMON )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XKBCOMMON )

set(CONAN_C_FLAGS_XKBCOMMON "")
set(CONAN_CXX_FLAGS_XKBCOMMON "")
set(CONAN_SHARED_LINKER_FLAGS_XKBCOMMON "")
set(CONAN_EXE_LINKER_FLAGS_XKBCOMMON "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XKBCOMMON_LIST "")
set(CONAN_CXX_FLAGS_XKBCOMMON_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XKBCOMMON_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XKBCOMMON "${CONAN_FRAMEWORKS_XKBCOMMON}" "_XKBCOMMON" "")
# Append to aggregated values variable
set(CONAN_LIBS_XKBCOMMON ${CONAN_PKG_LIBS_XKBCOMMON} ${CONAN_SYSTEM_LIBS_XKBCOMMON} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON})


#################
###  OPENGL
#################
set(CONAN_OPENGL_ROOT "/home/joao/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_OPENGL )
set(CONAN_LIB_DIRS_OPENGL )
set(CONAN_BIN_DIRS_OPENGL )
set(CONAN_RES_DIRS_OPENGL )
set(CONAN_SRC_DIRS_OPENGL )
set(CONAN_BUILD_DIRS_OPENGL "/home/joao/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_OPENGL )
set(CONAN_LIBS_OPENGL )
set(CONAN_PKG_LIBS_OPENGL )
set(CONAN_SYSTEM_LIBS_OPENGL GL)
set(CONAN_FRAMEWORKS_OPENGL )
set(CONAN_FRAMEWORKS_FOUND_OPENGL "")  # Will be filled later
set(CONAN_DEFINES_OPENGL )
set(CONAN_BUILD_MODULES_PATHS_OPENGL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENGL )

set(CONAN_C_FLAGS_OPENGL "")
set(CONAN_CXX_FLAGS_OPENGL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENGL_LIST "")
set(CONAN_CXX_FLAGS_OPENGL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENGL "${CONAN_FRAMEWORKS_OPENGL}" "_OPENGL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENGL ${CONAN_PKG_LIBS_OPENGL} ${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL})


#################
###  FREETYPE
#################
set(CONAN_FREETYPE_ROOT "/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3")
set(CONAN_INCLUDE_DIRS_FREETYPE "/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/include"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/include/freetype2")
set(CONAN_LIB_DIRS_FREETYPE "/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/lib")
set(CONAN_BIN_DIRS_FREETYPE "/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/bin")
set(CONAN_RES_DIRS_FREETYPE )
set(CONAN_SRC_DIRS_FREETYPE )
set(CONAN_BUILD_DIRS_FREETYPE "/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/")
set(CONAN_FRAMEWORK_DIRS_FREETYPE )
set(CONAN_LIBS_FREETYPE freetype)
set(CONAN_PKG_LIBS_FREETYPE freetype)
set(CONAN_SYSTEM_LIBS_FREETYPE m)
set(CONAN_FRAMEWORKS_FREETYPE )
set(CONAN_FRAMEWORKS_FOUND_FREETYPE "")  # Will be filled later
set(CONAN_DEFINES_FREETYPE )
set(CONAN_BUILD_MODULES_PATHS_FREETYPE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FREETYPE )

set(CONAN_C_FLAGS_FREETYPE "")
set(CONAN_CXX_FLAGS_FREETYPE "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FREETYPE_LIST "")
set(CONAN_CXX_FLAGS_FREETYPE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FREETYPE "${CONAN_FRAMEWORKS_FREETYPE}" "_FREETYPE" "")
# Append to aggregated values variable
set(CONAN_LIBS_FREETYPE ${CONAN_PKG_LIBS_FREETYPE} ${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE})


#################
###  EXPAT
#################
set(CONAN_EXPAT_ROOT "/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_EXPAT "/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(CONAN_LIB_DIRS_EXPAT "/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_EXPAT )
set(CONAN_RES_DIRS_EXPAT )
set(CONAN_SRC_DIRS_EXPAT )
set(CONAN_BUILD_DIRS_EXPAT "/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/")
set(CONAN_FRAMEWORK_DIRS_EXPAT )
set(CONAN_LIBS_EXPAT expat)
set(CONAN_PKG_LIBS_EXPAT expat)
set(CONAN_SYSTEM_LIBS_EXPAT )
set(CONAN_FRAMEWORKS_EXPAT )
set(CONAN_FRAMEWORKS_FOUND_EXPAT "")  # Will be filled later
set(CONAN_DEFINES_EXPAT "-DXML_STATIC")
set(CONAN_BUILD_MODULES_PATHS_EXPAT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_EXPAT "XML_STATIC")

set(CONAN_C_FLAGS_EXPAT "")
set(CONAN_CXX_FLAGS_EXPAT "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_EXPAT_LIST "")
set(CONAN_CXX_FLAGS_EXPAT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_EXPAT "${CONAN_FRAMEWORKS_EXPAT}" "_EXPAT" "")
# Append to aggregated values variable
set(CONAN_LIBS_EXPAT ${CONAN_PKG_LIBS_EXPAT} ${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT})


#################
###  LIBUUID
#################
set(CONAN_LIBUUID_ROOT "/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_LIBUUID "/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include/uuid")
set(CONAN_LIB_DIRS_LIBUUID "/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_LIBUUID )
set(CONAN_RES_DIRS_LIBUUID )
set(CONAN_SRC_DIRS_LIBUUID )
set(CONAN_BUILD_DIRS_LIBUUID "/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/")
set(CONAN_FRAMEWORK_DIRS_LIBUUID )
set(CONAN_LIBS_LIBUUID uuid)
set(CONAN_PKG_LIBS_LIBUUID uuid)
set(CONAN_SYSTEM_LIBS_LIBUUID )
set(CONAN_FRAMEWORKS_LIBUUID )
set(CONAN_FRAMEWORKS_FOUND_LIBUUID "")  # Will be filled later
set(CONAN_DEFINES_LIBUUID )
set(CONAN_BUILD_MODULES_PATHS_LIBUUID )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBUUID )

set(CONAN_C_FLAGS_LIBUUID "")
set(CONAN_CXX_FLAGS_LIBUUID "")
set(CONAN_SHARED_LINKER_FLAGS_LIBUUID "")
set(CONAN_EXE_LINKER_FLAGS_LIBUUID "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBUUID_LIST "")
set(CONAN_CXX_FLAGS_LIBUUID_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBUUID_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBUUID "${CONAN_FRAMEWORKS_LIBUUID}" "_LIBUUID" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBUUID ${CONAN_PKG_LIBS_LIBUUID} ${CONAN_SYSTEM_LIBS_LIBUUID} ${CONAN_FRAMEWORKS_FOUND_LIBUUID})


#################
###  XORG
#################
set(CONAN_XORG_ROOT "/home/joao/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XORG "/usr/include/uuid"
			"/usr/include/freetype2"
			"/usr/include/libpng16")
set(CONAN_LIB_DIRS_XORG )
set(CONAN_BIN_DIRS_XORG )
set(CONAN_RES_DIRS_XORG )
set(CONAN_SRC_DIRS_XORG )
set(CONAN_BUILD_DIRS_XORG "/home/joao/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_XORG )
set(CONAN_LIBS_XORG )
set(CONAN_PKG_LIBS_XORG )
set(CONAN_SYSTEM_LIBS_XORG X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama xcb-util xcb-dri3)
set(CONAN_FRAMEWORKS_XORG )
set(CONAN_FRAMEWORKS_FOUND_XORG "")  # Will be filled later
set(CONAN_DEFINES_XORG "-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT")
set(CONAN_BUILD_MODULES_PATHS_XORG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XORG "_DEFAULT_SOURCE"
			"_BSD_SOURCE"
			"HAS_FCHOWN"
			"HAS_STICKY_DIR_BIT")

set(CONAN_C_FLAGS_XORG "")
set(CONAN_CXX_FLAGS_XORG "")
set(CONAN_SHARED_LINKER_FLAGS_XORG "")
set(CONAN_EXE_LINKER_FLAGS_XORG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XORG_LIST "")
set(CONAN_CXX_FLAGS_XORG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XORG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XORG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XORG "${CONAN_FRAMEWORKS_XORG}" "_XORG" "")
# Append to aggregated values variable
set(CONAN_LIBS_XORG ${CONAN_PKG_LIBS_XORG} ${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG})


#################
###  LIBXML2
#################
set(CONAN_LIBXML2_ROOT "/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645")
set(CONAN_INCLUDE_DIRS_LIBXML2 "/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/include"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/include/libxml2")
set(CONAN_LIB_DIRS_LIBXML2 "/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/lib")
set(CONAN_BIN_DIRS_LIBXML2 "/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/bin")
set(CONAN_RES_DIRS_LIBXML2 )
set(CONAN_SRC_DIRS_LIBXML2 )
set(CONAN_BUILD_DIRS_LIBXML2 "/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/")
set(CONAN_FRAMEWORK_DIRS_LIBXML2 )
set(CONAN_LIBS_LIBXML2 xml2)
set(CONAN_PKG_LIBS_LIBXML2 xml2)
set(CONAN_SYSTEM_LIBS_LIBXML2 m)
set(CONAN_FRAMEWORKS_LIBXML2 )
set(CONAN_FRAMEWORKS_FOUND_LIBXML2 "")  # Will be filled later
set(CONAN_DEFINES_LIBXML2 "-DLIBXML_STATIC")
set(CONAN_BUILD_MODULES_PATHS_LIBXML2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBXML2 "LIBXML_STATIC")

set(CONAN_C_FLAGS_LIBXML2 "")
set(CONAN_CXX_FLAGS_LIBXML2 "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXML2 "")
set(CONAN_EXE_LINKER_FLAGS_LIBXML2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBXML2_LIST "")
set(CONAN_CXX_FLAGS_LIBXML2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBXML2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBXML2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBXML2 "${CONAN_FRAMEWORKS_LIBXML2}" "_LIBXML2" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBXML2 ${CONAN_PKG_LIBS_LIBXML2} ${CONAN_SYSTEM_LIBS_LIBXML2} ${CONAN_FRAMEWORKS_FOUND_LIBXML2})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0")
set(CONAN_INCLUDE_DIRS_BZIP2 "/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/include")
set(CONAN_LIB_DIRS_BZIP2 "/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/lib")
set(CONAN_BIN_DIRS_BZIP2 "/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


#################
###  LIBPNG
#################
set(CONAN_LIBPNG_ROOT "/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77")
set(CONAN_INCLUDE_DIRS_LIBPNG "/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/include")
set(CONAN_LIB_DIRS_LIBPNG "/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/lib")
set(CONAN_BIN_DIRS_LIBPNG "/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/bin")
set(CONAN_RES_DIRS_LIBPNG )
set(CONAN_SRC_DIRS_LIBPNG )
set(CONAN_BUILD_DIRS_LIBPNG "/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/")
set(CONAN_FRAMEWORK_DIRS_LIBPNG )
set(CONAN_LIBS_LIBPNG png16)
set(CONAN_PKG_LIBS_LIBPNG png16)
set(CONAN_SYSTEM_LIBS_LIBPNG m)
set(CONAN_FRAMEWORKS_LIBPNG )
set(CONAN_FRAMEWORKS_FOUND_LIBPNG "")  # Will be filled later
set(CONAN_DEFINES_LIBPNG )
set(CONAN_BUILD_MODULES_PATHS_LIBPNG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPNG )

set(CONAN_C_FLAGS_LIBPNG "")
set(CONAN_CXX_FLAGS_LIBPNG "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPNG_LIST "")
set(CONAN_CXX_FLAGS_LIBPNG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPNG "${CONAN_FRAMEWORKS_LIBPNG}" "_LIBPNG" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPNG ${CONAN_PKG_LIBS_LIBPNG} ${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG})


#################
###  BROTLI
#################
set(CONAN_BROTLI_ROOT "/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_BROTLI "/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include/brotli")
set(CONAN_LIB_DIRS_BROTLI "/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_BROTLI )
set(CONAN_RES_DIRS_BROTLI )
set(CONAN_SRC_DIRS_BROTLI )
set(CONAN_BUILD_DIRS_BROTLI "/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/")
set(CONAN_FRAMEWORK_DIRS_BROTLI )
set(CONAN_LIBS_BROTLI brotlidec-static brotlienc-static brotlicommon-static)
set(CONAN_PKG_LIBS_BROTLI brotlidec-static brotlienc-static brotlicommon-static)
set(CONAN_SYSTEM_LIBS_BROTLI m)
set(CONAN_FRAMEWORKS_BROTLI )
set(CONAN_FRAMEWORKS_FOUND_BROTLI "")  # Will be filled later
set(CONAN_DEFINES_BROTLI )
set(CONAN_BUILD_MODULES_PATHS_BROTLI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BROTLI )

set(CONAN_C_FLAGS_BROTLI "")
set(CONAN_CXX_FLAGS_BROTLI "")
set(CONAN_SHARED_LINKER_FLAGS_BROTLI "")
set(CONAN_EXE_LINKER_FLAGS_BROTLI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BROTLI_LIST "")
set(CONAN_CXX_FLAGS_BROTLI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BROTLI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BROTLI "${CONAN_FRAMEWORKS_BROTLI}" "_BROTLI" "")
# Append to aggregated values variable
set(CONAN_LIBS_BROTLI ${CONAN_PKG_LIBS_BROTLI} ${CONAN_SYSTEM_LIBS_BROTLI} ${CONAN_FRAMEWORKS_FOUND_BROTLI})


#################
###  LIBICONV
#################
set(CONAN_LIBICONV_ROOT "/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_LIBICONV "/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(CONAN_LIB_DIRS_LIBICONV "/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_LIBICONV "/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/bin")
set(CONAN_RES_DIRS_LIBICONV )
set(CONAN_SRC_DIRS_LIBICONV )
set(CONAN_BUILD_DIRS_LIBICONV "/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/")
set(CONAN_FRAMEWORK_DIRS_LIBICONV )
set(CONAN_LIBS_LIBICONV iconv charset)
set(CONAN_PKG_LIBS_LIBICONV iconv charset)
set(CONAN_SYSTEM_LIBS_LIBICONV )
set(CONAN_FRAMEWORKS_LIBICONV )
set(CONAN_FRAMEWORKS_FOUND_LIBICONV "")  # Will be filled later
set(CONAN_DEFINES_LIBICONV )
set(CONAN_BUILD_MODULES_PATHS_LIBICONV )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBICONV )

set(CONAN_C_FLAGS_LIBICONV "")
set(CONAN_CXX_FLAGS_LIBICONV "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBICONV_LIST "")
set(CONAN_CXX_FLAGS_LIBICONV_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBICONV "${CONAN_FRAMEWORKS_LIBICONV}" "_LIBICONV" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBICONV ${CONAN_PKG_LIBS_LIBICONV} ${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709")
set(CONAN_INCLUDE_DIRS_ZLIB "/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(CONAN_LIB_DIRS_ZLIB "/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME khanwarsSimplifier)
set(CONAN_PACKAGE_VERSION 0.1)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "gcc")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libstdc++11")
set(CONAN_SETTINGS_COMPILER_VERSION "9")
set(CONAN_SETTINGS_OS "Linux")

set(CONAN_DEPENDENCIES qt openssl pcre2 double-conversion fontconfig icu sqlite3 libpq odbc xkbcommon opengl freetype expat libuuid xorg libxml2 bzip2 libpng brotli libiconv zlib)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtNetwork"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtSql"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtTest"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtPrintSupport"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtOpenGLWidgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtWidgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtOpenGL"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtGui"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtDBus"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtConcurrent"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtXml"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/include/QtCore"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/include"
			"/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/include"
			"/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/include"
			"/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/include"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/include"
			"/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/include"
			"/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/include"
			"/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/include"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/include"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/include/freetype2"
			"/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include/uuid"
			"/usr/include/uuid"
			"/usr/include/freetype2"
			"/usr/include/libpng16"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/include"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/include/libxml2"
			"/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/include"
			"/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/include"
			"/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include/brotli"
			"/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include"
			"/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/res/archdatadir/plugins/sqldrivers"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib"
			"/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/lib"
			"/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/lib"
			"/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/lib"
			"/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/lib"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/lib"
			"/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/lib"
			"/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/lib"
			"/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/lib"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/lib"
			"/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib"
			"/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/lib"
			"/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/lib"
			"/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/lib"
			"/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib"
			"/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib"
			"/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/bin"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/bin"
			"/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/bin"
			"/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/bin"
			"/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/bin"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/bin"
			"/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/bin"
			"/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/bin"
			"/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/bin"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/bin"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/bin"
			"/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/bin"
			"/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/bin"
			"/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/res"
			"/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS qsqlite qsqlpsql qsqlodbc Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6DBus Qt6Concurrent Qt6Xml Qt6Core Qt6Core_qobject ssl crypto pcre2-posix pcre2-8 pcre2-16 pcre2-32 double-conversion fontconfig icuio icutest icutu icui18n icuuc icudata sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib odbc odbcinst odbccr ltdl xkbcommon-x11 xkbcommon xkbregistry freetype expat uuid xml2 bz2 png16 brotlidec-static brotlienc-static brotlicommon-static iconv charset z ${CONAN_LIBS})
set(CONAN_PKG_LIBS qsqlite qsqlpsql qsqlodbc Qt6Network Qt6Sql Qt6Test Qt6PrintSupport Qt6OpenGLWidgets Qt6Widgets Qt6OpenGL Qt6Gui Qt6DBus Qt6Concurrent Qt6Xml Qt6Core Qt6Core_qobject ssl crypto pcre2-posix pcre2-8 pcre2-16 pcre2-32 double-conversion fontconfig icuio icutest icutu icui18n icuuc icudata sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib odbc odbcinst odbccr ltdl xkbcommon-x11 xkbcommon xkbregistry freetype expat uuid xml2 bz2 png16 brotlidec-static brotlienc-static brotlicommon-static iconv charset z ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS rt stdc++ pthread dl GL X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama xcb-util xcb-dri3 m ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DLIBXML_STATIC"
			"-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT"
			"-DXML_STATIC"
			"-DU_STATIC_IMPLEMENTATION"
			"-DPCRE2_STATIC"
			"-DQT_NETWORK_LIB"
			"-DQT_SQL_LIB"
			"-DQT_TEST_LIB"
			"-DQT_PRINTSUPPORT_LIB"
			"-DQT_OPENGLWIDGETS_LIB"
			"-DQT_WIDGETS_LIB"
			"-DQT_OPENGL_LIB"
			"-DQT_GUI_LIB"
			"-DQT_DBUS_LIB"
			"-DQT_CONCURRENT_LIB"
			"-DQT_XML_LIB"
			"-DQT_CORE_LIB" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6Widgets"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6DBus"
			"/home/joao/.conan/data/qt/6.0.3/_/_/package/a4f3c9d49d5ce61f2b2f3dd61da3feebfea5dcc0/lib/cmake/Qt6Core"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/openssl/1.1.1j/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib/cmake"
			"/home/joao/.conan/data/pcre2/10.36/_/_/package/3b544e62795c293d95ba624360f2fc91ca32ce44/"
			"/home/joao/.conan/data/double-conversion/3.1.5/_/_/package/b911f48570f9bb2902d9e83b2b9ebf9d376c8c56/"
			"/home/joao/.conan/data/fontconfig/2.13.93/_/_/package/e135b8afaaf9274276e3ae293315395467cd735b/"
			"/home/joao/.conan/data/icu/68.2/_/_/package/1524904dd725e06dec6d8b171834126a56e52d5a/"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/"
			"/home/joao/.conan/data/sqlite3/3.35.2/_/_/package/2d58be9bb4c6ae229bfa535a871254048b78dd8b/lib/cmake"
			"/home/joao/.conan/data/libpq/13.2/_/_/package/8e0939db49a1d312829524beb4d0b6824e47691d/"
			"/home/joao/.conan/data/odbc/2.3.9/_/_/package/b29d3eb003873b92a248c0df6debab47f53853ea/"
			"/home/joao/.conan/data/xkbcommon/1.1.0/_/_/package/46413bc1d1945f58b030a13621c52b586e8a7a6c/"
			"/home/joao/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/joao/.conan/data/freetype/2.10.4/_/_/package/f1014dc4f9380132c471ceb778980949abf136d3/"
			"/home/joao/.conan/data/expat/2.2.10/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/libuuid/1.0.3/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/joao/.conan/data/libxml2/2.9.10/_/_/package/e9a3e7dd6ab9bf161be4ac8c0925d9a6ba8f2645/"
			"/home/joao/.conan/data/bzip2/1.0.8/_/_/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/"
			"/home/joao/.conan/data/libpng/1.6.37/_/_/package/f99afdbf2a1cc98ba2029817b35103455b6a9b77/"
			"/home/joao/.conan/data/brotli/1.0.9/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/libiconv/1.16/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/"
			"/home/joao/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_QT} ${CONAN_FRAMEWORKS_FOUND_QT} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xorg CONAN_PKG::xkbcommon CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT}" "${CONAN_LIB_DIRS_QT}"
                                  CONAN_PACKAGE_TARGETS_QT "${_CONAN_PKG_LIBS_QT_DEPENDENCIES}"
                                  "" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_QT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_QT_DEBUG} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xorg CONAN_PKG::xkbcommon CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_DEBUG}" "${CONAN_LIB_DIRS_QT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_QT_DEBUG "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}"
                                  "debug" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_QT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_QT_RELEASE} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xorg CONAN_PKG::xkbcommon CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELEASE}" "${CONAN_LIB_DIRS_QT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_QT_RELEASE "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}"
                                  "release" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_QT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_QT_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xorg CONAN_PKG::xkbcommon CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_QT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" qt)
    set(_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_QT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_QT_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::freetype CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::libpng CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xorg CONAN_PKG::xkbcommon CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_QT_MINSIZEREL}" "${CONAN_LIB_DIRS_QT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_QT_MINSIZEREL "${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" qt)

    add_library(CONAN_PKG::qt INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_QT} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_QT_RELEASE} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_QT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_QT_MINSIZEREL} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_QT_DEBUG} ${_CONAN_PKG_LIBS_QT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_QT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_QT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_QT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_QT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_QT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_QT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_QT_DEBUG}>)
    set_property(TARGET CONAN_PKG::qt PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_QT_LIST} ${CONAN_CXX_FLAGS_QT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_QT_RELEASE_LIST} ${CONAN_CXX_FLAGS_QT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_QT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_QT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_QT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_QT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_QT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_QT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL}" "${CONAN_LIB_DIRS_OPENSSL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}"
                                  "" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENSSL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_DEBUG}" "${CONAN_LIB_DIRS_OPENSSL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}"
                                  "debug" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENSSL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELEASE}" "${CONAN_LIB_DIRS_OPENSSL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}"
                                  "release" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENSSL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENSSL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENSSL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENSSL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openssl)

    add_library(CONAN_PKG::openssl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENSSL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENSSL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENSSL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENSSL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENSSL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENSSL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENSSL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2}" "${CONAN_LIB_DIRS_PCRE2}"
                                  CONAN_PACKAGE_TARGETS_PCRE2 "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}"
                                  "" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE2_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_DEBUG}" "${CONAN_LIB_DIRS_PCRE2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}"
                                  "debug" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELEASE}" "${CONAN_LIB_DIRS_PCRE2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}"
                                  "release" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE2_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre2)

    add_library(CONAN_PKG::pcre2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE2} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE2_RELEASE} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE2_DEBUG} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE2_LIST} ${CONAN_CXX_FLAGS_PCRE2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE2_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}"
                                  "" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEBUG}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}"
                                  "debug" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELEASE}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}"
                                  "release" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" double-conversion)
    set(_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DOUBLE-CONVERSION_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DOUBLE-CONVERSION_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOUBLE-CONVERSION_MINSIZEREL}" "${CONAN_LIB_DIRS_DOUBLE-CONVERSION_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL "${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" double-conversion)

    add_library(CONAN_PKG::double-conversion INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELEASE} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_MINSIZEREL} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DOUBLE-CONVERSION_DEBUG} ${_CONAN_PKG_LIBS_DOUBLE-CONVERSION_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DOUBLE-CONVERSION_DEBUG}>)
    set_property(TARGET CONAN_PKG::double-conversion PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DOUBLE-CONVERSION_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DOUBLE-CONVERSION_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FONTCONFIG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG}" "${CONAN_LIB_DIRS_FONTCONFIG}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}"
                                  "" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FONTCONFIG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_DEBUG} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_DEBUG}" "${CONAN_LIB_DIRS_FONTCONFIG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_DEBUG "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}"
                                  "debug" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FONTCONFIG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_RELEASE} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_RELEASE}" "${CONAN_LIB_DIRS_FONTCONFIG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_RELEASE "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}"
                                  "release" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FONTCONFIG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_RELWITHDEBINFO} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FONTCONFIG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" fontconfig)
    set(_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FONTCONFIG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FONTCONFIG_MINSIZEREL} CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FONTCONFIG_MINSIZEREL}" "${CONAN_LIB_DIRS_FONTCONFIG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FONTCONFIG_MINSIZEREL "${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" fontconfig)

    add_library(CONAN_PKG::fontconfig INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FONTCONFIG} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_RELEASE} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_MINSIZEREL} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FONTCONFIG_DEBUG} ${_CONAN_PKG_LIBS_FONTCONFIG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FONTCONFIG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FONTCONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FONTCONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FONTCONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FONTCONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FONTCONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FONTCONFIG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FONTCONFIG_DEBUG}>)
    set_property(TARGET CONAN_PKG::fontconfig PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FONTCONFIG_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FONTCONFIG_RELEASE_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FONTCONFIG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FONTCONFIG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FONTCONFIG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FONTCONFIG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ICU} ${CONAN_FRAMEWORKS_FOUND_ICU} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU}" "${CONAN_LIB_DIRS_ICU}"
                                  CONAN_PACKAGE_TARGETS_ICU "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}"
                                  "" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ICU_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ICU_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_DEBUG}" "${CONAN_LIB_DIRS_ICU_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ICU_DEBUG "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}"
                                  "debug" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ICU_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ICU_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_RELEASE}" "${CONAN_LIB_DIRS_ICU_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ICU_RELEASE "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}"
                                  "release" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ICU_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ICU_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ICU_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ICU_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" icu)
    set(_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ICU_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ICU_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ICU_MINSIZEREL}" "${CONAN_LIB_DIRS_ICU_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ICU_MINSIZEREL "${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" icu)

    add_library(CONAN_PKG::icu INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ICU} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ICU_RELEASE} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ICU_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ICU_MINSIZEREL} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ICU_DEBUG} ${_CONAN_PKG_LIBS_ICU_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ICU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ICU_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ICU}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ICU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ICU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ICU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ICU_DEBUG}>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ICU}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ICU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ICU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ICU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ICU_DEBUG}>)
    set_property(TARGET CONAN_PKG::icu PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ICU_LIST} ${CONAN_CXX_FLAGS_ICU_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ICU_RELEASE_LIST} ${CONAN_CXX_FLAGS_ICU_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ICU_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ICU_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ICU_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ICU_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ICU_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ICU_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3}" "${CONAN_LIB_DIRS_SQLITE3}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3 "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}"
                                  "" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE3_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_DEBUG}" "${CONAN_LIB_DIRS_SQLITE3_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE3_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELEASE}" "${CONAN_LIB_DIRS_SQLITE3_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}"
                                  "release" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE3_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE3_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE3_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE3_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite3)

    add_library(CONAN_PKG::sqlite3 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE3} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE3_LIST} ${CONAN_CXX_FLAGS_SQLITE3_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE3_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE3_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE3_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE3_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE3_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ}" "${CONAN_LIB_DIRS_LIBPQ}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}"
                                  "" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPQ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_DEBUG}" "${CONAN_LIB_DIRS_LIBPQ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}"
                                  "debug" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPQ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELEASE}" "${CONAN_LIB_DIRS_LIBPQ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}"
                                  "release" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPQ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPQ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPQ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPQ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpq)

    add_library(CONAN_PKG::libpq INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPQ} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPQ_LIST} ${CONAN_CXX_FLAGS_LIBPQ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPQ_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPQ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPQ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPQ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPQ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ODBC} ${CONAN_FRAMEWORKS_FOUND_ODBC} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC}" "${CONAN_LIB_DIRS_ODBC}"
                                  CONAN_PACKAGE_TARGETS_ODBC "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}"
                                  "" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ODBC_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ODBC_DEBUG} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_DEBUG}" "${CONAN_LIB_DIRS_ODBC_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ODBC_DEBUG "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}"
                                  "debug" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ODBC_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELEASE} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELEASE}" "${CONAN_LIB_DIRS_ODBC_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELEASE "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}"
                                  "release" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ODBC_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ODBC_RELWITHDEBINFO} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ODBC_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" odbc)
    set(_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ODBC_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ODBC_MINSIZEREL} CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ODBC_MINSIZEREL}" "${CONAN_LIB_DIRS_ODBC_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL "${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" odbc)

    add_library(CONAN_PKG::odbc INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ODBC} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ODBC_RELEASE} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ODBC_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ODBC_MINSIZEREL} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ODBC_DEBUG} ${_CONAN_PKG_LIBS_ODBC_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ODBC_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ODBC_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ODBC}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ODBC_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ODBC_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ODBC_DEBUG}>)
    set_property(TARGET CONAN_PKG::odbc PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ODBC_LIST} ${CONAN_CXX_FLAGS_ODBC_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ODBC_RELEASE_LIST} ${CONAN_CXX_FLAGS_ODBC_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ODBC_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ODBC_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ODBC_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ODBC_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ODBC_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ODBC_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XKBCOMMON} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON} CONAN_PKG::xorg CONAN_PKG::libxml2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON}" "${CONAN_LIB_DIRS_XKBCOMMON}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}"
                                  "" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XKBCOMMON_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_DEBUG} CONAN_PKG::xorg CONAN_PKG::libxml2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_DEBUG}" "${CONAN_LIB_DIRS_XKBCOMMON_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_DEBUG "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}"
                                  "debug" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XKBCOMMON_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_RELEASE} CONAN_PKG::xorg CONAN_PKG::libxml2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_RELEASE}" "${CONAN_LIB_DIRS_XKBCOMMON_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_RELEASE "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}"
                                  "release" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XKBCOMMON_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_RELWITHDEBINFO} CONAN_PKG::xorg CONAN_PKG::libxml2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XKBCOMMON_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xkbcommon)
    set(_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XKBCOMMON_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XKBCOMMON_MINSIZEREL} CONAN_PKG::xorg CONAN_PKG::libxml2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XKBCOMMON_MINSIZEREL}" "${CONAN_LIB_DIRS_XKBCOMMON_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XKBCOMMON_MINSIZEREL "${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xkbcommon)

    add_library(CONAN_PKG::xkbcommon INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XKBCOMMON} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_RELEASE} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_MINSIZEREL} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XKBCOMMON_DEBUG} ${_CONAN_PKG_LIBS_XKBCOMMON_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XKBCOMMON_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XKBCOMMON}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XKBCOMMON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XKBCOMMON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XKBCOMMON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XKBCOMMON_DEBUG}>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XKBCOMMON}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XKBCOMMON_DEBUG}>)
    set_property(TARGET CONAN_PKG::xkbcommon PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XKBCOMMON_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XKBCOMMON_RELEASE_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XKBCOMMON_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XKBCOMMON_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XKBCOMMON_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XKBCOMMON_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL}" "${CONAN_LIB_DIRS_OPENGL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}"
                                  "" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENGL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENGL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_DEBUG}" "${CONAN_LIB_DIRS_OPENGL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}"
                                  "debug" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENGL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELEASE}" "${CONAN_LIB_DIRS_OPENGL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}"
                                  "release" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENGL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENGL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENGL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENGL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENGL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opengl)

    add_library(CONAN_PKG::opengl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENGL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENGL_RELEASE} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENGL_DEBUG} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENGL_LIST} ${CONAN_CXX_FLAGS_OPENGL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENGL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENGL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENGL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENGL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENGL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FREETYPE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE}" "${CONAN_LIB_DIRS_FREETYPE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}"
                                  "" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FREETYPE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_DEBUG} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_DEBUG}" "${CONAN_LIB_DIRS_FREETYPE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}"
                                  "debug" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FREETYPE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELEASE} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELEASE}" "${CONAN_LIB_DIRS_FREETYPE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}"
                                  "release" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FREETYPE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_RELWITHDEBINFO} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FREETYPE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" freetype)
    set(_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FREETYPE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FREETYPE_MINSIZEREL} CONAN_PKG::libpng CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::brotli")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FREETYPE_MINSIZEREL}" "${CONAN_LIB_DIRS_FREETYPE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL "${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" freetype)

    add_library(CONAN_PKG::freetype INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FREETYPE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELEASE} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FREETYPE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FREETYPE_MINSIZEREL} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FREETYPE_DEBUG} ${_CONAN_PKG_LIBS_FREETYPE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FREETYPE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FREETYPE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FREETYPE_DEBUG}>)
    set_property(TARGET CONAN_PKG::freetype PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FREETYPE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FREETYPE_RELEASE_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FREETYPE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FREETYPE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FREETYPE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FREETYPE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FREETYPE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FREETYPE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT}" "${CONAN_LIB_DIRS_EXPAT}"
                                  CONAN_PACKAGE_TARGETS_EXPAT "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}"
                                  "" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_EXPAT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_EXPAT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_DEBUG}" "${CONAN_LIB_DIRS_EXPAT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}"
                                  "debug" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_EXPAT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELEASE}" "${CONAN_LIB_DIRS_EXPAT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}"
                                  "release" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_EXPAT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_EXPAT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_EXPAT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_EXPAT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_MINSIZEREL}" "${CONAN_LIB_DIRS_EXPAT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" expat)

    add_library(CONAN_PKG::expat INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_EXPAT} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_EXPAT_RELEASE} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_EXPAT_DEBUG} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_EXPAT_LIST} ${CONAN_CXX_FLAGS_EXPAT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_EXPAT_RELEASE_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_EXPAT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_EXPAT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_EXPAT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_EXPAT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBUUID} ${CONAN_FRAMEWORKS_FOUND_LIBUUID} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID}" "${CONAN_LIB_DIRS_LIBUUID}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}"
                                  "" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBUUID_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_DEBUG}" "${CONAN_LIB_DIRS_LIBUUID_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_DEBUG "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}"
                                  "debug" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBUUID_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_RELEASE}" "${CONAN_LIB_DIRS_LIBUUID_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_RELEASE "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}"
                                  "release" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBUUID_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBUUID_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libuuid)
    set(_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBUUID_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBUUID_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBUUID_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBUUID_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBUUID_MINSIZEREL "${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libuuid)

    add_library(CONAN_PKG::libuuid INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBUUID} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBUUID_RELEASE} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBUUID_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBUUID_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBUUID_DEBUG} ${_CONAN_PKG_LIBS_LIBUUID_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBUUID_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBUUID}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBUUID_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBUUID_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBUUID_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBUUID_DEBUG}>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBUUID}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBUUID_DEBUG}>)
    set_property(TARGET CONAN_PKG::libuuid PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBUUID_LIST} ${CONAN_CXX_FLAGS_LIBUUID_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBUUID_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBUUID_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBUUID_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBUUID_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBUUID_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBUUID_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBUUID_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBUUID_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG}" "${CONAN_LIB_DIRS_XORG}"
                                  CONAN_PACKAGE_TARGETS_XORG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}"
                                  "" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XORG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XORG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_DEBUG}" "${CONAN_LIB_DIRS_XORG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XORG_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}"
                                  "debug" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XORG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XORG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELEASE}" "${CONAN_LIB_DIRS_XORG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}"
                                  "release" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XORG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XORG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XORG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XORG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XORG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_MINSIZEREL}" "${CONAN_LIB_DIRS_XORG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xorg)

    add_library(CONAN_PKG::xorg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XORG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XORG_RELEASE} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XORG_DEBUG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XORG_LIST} ${CONAN_CXX_FLAGS_XORG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XORG_RELEASE_LIST} ${CONAN_CXX_FLAGS_XORG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XORG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XORG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XORG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XORG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBXML2} ${CONAN_FRAMEWORKS_FOUND_LIBXML2} CONAN_PKG::zlib CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXML2}" "${CONAN_LIB_DIRS_LIBXML2}"
                                  CONAN_PACKAGE_TARGETS_LIBXML2 "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES}"
                                  "" libxml2)
    set(_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBXML2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBXML2_DEBUG} CONAN_PKG::zlib CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXML2_DEBUG}" "${CONAN_LIB_DIRS_LIBXML2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBXML2_DEBUG "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_DEBUG}"
                                  "debug" libxml2)
    set(_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBXML2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBXML2_RELEASE} CONAN_PKG::zlib CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXML2_RELEASE}" "${CONAN_LIB_DIRS_LIBXML2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBXML2_RELEASE "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELEASE}"
                                  "release" libxml2)
    set(_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBXML2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBXML2_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXML2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBXML2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBXML2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libxml2)
    set(_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBXML2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBXML2_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::libiconv")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBXML2_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBXML2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBXML2_MINSIZEREL "${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libxml2)

    add_library(CONAN_PKG::libxml2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libxml2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBXML2} ${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXML2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBXML2_RELEASE} ${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXML2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBXML2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXML2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBXML2_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXML2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBXML2_DEBUG} ${_CONAN_PKG_LIBS_LIBXML2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBXML2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBXML2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libxml2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBXML2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBXML2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBXML2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBXML2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBXML2_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxml2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBXML2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBXML2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBXML2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBXML2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBXML2_DEBUG}>)
    set_property(TARGET CONAN_PKG::libxml2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBXML2_LIST} ${CONAN_CXX_FLAGS_LIBXML2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBXML2_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBXML2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBXML2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBXML2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBXML2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBXML2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBXML2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBXML2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPNG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG}" "${CONAN_LIB_DIRS_LIBPNG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}"
                                  "" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPNG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_DEBUG} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_DEBUG}" "${CONAN_LIB_DIRS_LIBPNG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}"
                                  "debug" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPNG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELEASE} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELEASE}" "${CONAN_LIB_DIRS_LIBPNG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}"
                                  "release" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPNG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_RELWITHDEBINFO} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPNG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpng)
    set(_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPNG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPNG_MINSIZEREL} CONAN_PKG::zlib")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPNG_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPNG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpng)

    add_library(CONAN_PKG::libpng INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPNG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELEASE} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPNG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPNG_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPNG_DEBUG} ${_CONAN_PKG_LIBS_LIBPNG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPNG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPNG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPNG_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpng PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPNG_LIST} ${CONAN_CXX_FLAGS_LIBPNG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPNG_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPNG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPNG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPNG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPNG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPNG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPNG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BROTLI} ${CONAN_FRAMEWORKS_FOUND_BROTLI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI}" "${CONAN_LIB_DIRS_BROTLI}"
                                  CONAN_PACKAGE_TARGETS_BROTLI "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}"
                                  "" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BROTLI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BROTLI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_DEBUG}" "${CONAN_LIB_DIRS_BROTLI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_DEBUG "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}"
                                  "debug" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BROTLI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BROTLI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_RELEASE}" "${CONAN_LIB_DIRS_BROTLI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_RELEASE "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}"
                                  "release" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BROTLI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BROTLI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BROTLI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" brotli)
    set(_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BROTLI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BROTLI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BROTLI_MINSIZEREL}" "${CONAN_LIB_DIRS_BROTLI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BROTLI_MINSIZEREL "${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" brotli)

    add_library(CONAN_PKG::brotli INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BROTLI} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BROTLI_RELEASE} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BROTLI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BROTLI_MINSIZEREL} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BROTLI_DEBUG} ${_CONAN_PKG_LIBS_BROTLI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BROTLI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BROTLI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BROTLI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BROTLI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BROTLI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BROTLI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BROTLI_DEBUG}>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BROTLI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BROTLI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BROTLI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BROTLI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BROTLI_DEBUG}>)
    set_property(TARGET CONAN_PKG::brotli PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BROTLI_LIST} ${CONAN_CXX_FLAGS_BROTLI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BROTLI_RELEASE_LIST} ${CONAN_CXX_FLAGS_BROTLI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BROTLI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BROTLI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BROTLI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BROTLI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BROTLI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BROTLI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBICONV} ${CONAN_FRAMEWORKS_FOUND_LIBICONV} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV}" "${CONAN_LIB_DIRS_LIBICONV}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}"
                                  "" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBICONV_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_DEBUG}" "${CONAN_LIB_DIRS_LIBICONV_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}"
                                  "debug" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBICONV_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELEASE}" "${CONAN_LIB_DIRS_LIBICONV_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}"
                                  "release" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBICONV_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBICONV_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libiconv)
    set(_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBICONV_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBICONV_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBICONV_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBICONV_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL "${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libiconv)

    add_library(CONAN_PKG::libiconv INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBICONV} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELEASE} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBICONV_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBICONV_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBICONV_DEBUG} ${_CONAN_PKG_LIBS_LIBICONV_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBICONV_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBICONV}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBICONV_DEBUG}>)
    set_property(TARGET CONAN_PKG::libiconv PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBICONV_LIST} ${CONAN_CXX_FLAGS_LIBICONV_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBICONV_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBICONV_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBICONV_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBICONV_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBICONV_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBICONV_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBICONV_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::qt CONAN_PKG::openssl CONAN_PKG::pcre2 CONAN_PKG::double-conversion CONAN_PKG::fontconfig CONAN_PKG::icu CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::odbc CONAN_PKG::xkbcommon CONAN_PKG::opengl CONAN_PKG::freetype CONAN_PKG::expat CONAN_PKG::libuuid CONAN_PKG::xorg CONAN_PKG::libxml2 CONAN_PKG::bzip2 CONAN_PKG::libpng CONAN_PKG::brotli CONAN_PKG::libiconv CONAN_PKG::zlib)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_FREETYPE_LIBTOOL_VERSION "23.0.17")