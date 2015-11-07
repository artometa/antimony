FLEXSOURCE = src/tree/v2syntax.l

flex.name = flex ${QMAKE_FILE_IN}
flex.input = FLEXSOURCE
flex.output = $${OUT_PWD}/${QMAKE_FILE_BASE}.yy.cpp \
              $${OUT_PWD}/${QMAKE_FILE_BASE}.yy.hpp
flex.commands = flex --outfile=$${OUT_PWD}/${QMAKE_FILE_BASE}.yy.cpp \
                      --header-file=$${OUT_PWD}/${QMAKE_FILE_BASE}.yy.hpp \
                      ${QMAKE_FILE_IN}
flex.variable_out = GENERATED_SOURCES
flex.clean = $${OUT_PWD}/${QMAKE_FILE_BASE}.yy.hpp \
             $${OUT_PWD}/${QMAKE_FILE_BASE}.yy.cpp

# Force lemon to run before flex, because flex needs lemon's compiled header
flex.depends = $${OUT_PWD}/${QMAKE_FILE_BASE}.lemon.o

flex.CONFIG += target_predeps
QMAKE_EXTRA_COMPILERS += flex

INCLUDEPATH += $${OUT_PWD}
