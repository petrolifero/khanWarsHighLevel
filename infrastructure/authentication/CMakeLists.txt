add_subdirectory(authentication)

set(authenticationTypes
      environmentVariable
      )

foreach(implementation ${authenticationTypes})
  add_subdirectory(${implementation})
endforeach()
