SRC_PATH=src
INC_PATH=inc
OBJ_PATH=obj
LIB_PATH=.
CFLAGS=-I INC_PATH
CC=gcc
SRCS=$(shell find "${SRC_PATH}" -name "*.c")
OBJS=${patsubst ${SRC_PATH}/%,${OBJ_PATH}/%,${SRCS:.c=.o}}
MKDIR=mkdir -p

all: ${OBJS} main.c
	${CC} ${OBJS} main.c -I ${INC_PATH}

${OBJS}: ${SRCS}
	${MKDIR} ${@D}
	${CC} -c ${CFLAGS} -o $@ ${patsubst ${OBJ_PATH}/%,${SRC_PATH}/%,${@:.o=.c}}

lib: ${SRCS}
	@echo ${SRCS}
	@echo ${OBJS}

.PHONY: all lib 