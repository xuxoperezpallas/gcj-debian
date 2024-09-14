# Variables configuration
CC=gcc
CFLAGS=-Wall -Wextra -I./include
LDFLAGS=

# C source files
SRCS=$(wildcard src/c/*.c)

# Object files
OBJS=$(SRCS:.c=.o)

# Java source files
JAVA_SRCS=$(wildcard src/java/*.java)

# Java class files
CLASSES=$(JAVA_SRCS:.java=.class)

# Target executable
TARGET=gcj_debian

# OS Detection for Windows or Linux
UNAME_S := $(shell uname -s)

# Main rule to compile the project
all: $(TARGET)

$(TARGET): $(OBJS) $(CLASSES)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

# Rule to generate object files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to compile Java files
%.class: %.java
	javac -d bin $<

# Rule to clean generated files
clean:
	rm -f $(OBJS) $(CLASSES) $(TARGET)
	rm -rf vs_project

# Rule to generate Visual Studio project on Windows
generate_vs_project:
ifeq ($(UNAME_S),MINGW64_NT)
	mkdir -p vs_project
	cd vs_project && cmake -G
