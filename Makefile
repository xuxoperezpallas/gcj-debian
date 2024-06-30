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

# Main rule to compile the project
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

# Rule to generate the Visual Studio project
generate_vs_project:
	mkdir -p vs_project
	cd vs_project && cmake -G "Visual Studio 16 2019" ..
	@echo "Visual Studio project generated in the 'vs_project' directory."

.PHONY: clean generate_vs_project
