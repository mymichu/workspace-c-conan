set(SOURCES
    
    ${CMAKE_CURRENT_LIST_DIR}/main.c
)

add_library(calculator STATIC ${CMAKE_CURRENT_LIST_DIR}/calculator.c
                              ${CMAKE_CURRENT_LIST_DIR}/calculator.h)
        
add_executable(example main.c)
target_link_libraries(example PRIVATE calculator)