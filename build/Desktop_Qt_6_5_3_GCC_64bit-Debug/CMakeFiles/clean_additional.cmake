# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appInfotainmentSystem-UI_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appInfotainmentSystem-UI_autogen.dir/ParseCache.txt"
  "appInfotainmentSystem-UI_autogen"
  )
endif()
