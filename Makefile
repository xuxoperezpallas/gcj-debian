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

# Test C++ source files
TEST_SRCS=$(wildcard tests/*.cpp)

# Test object files
TEST_OBJS=$(TEST_SRCS:.cpp=.o)

# Test executable
TEST_TARGET=test_suite

# JUnit test files
JAVA_TEST_SRCS=$(wildcard tests/java/*.java)

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
	rm -f $(OBJS) $(CLASSES) $(TARGET) $(TEST_OBJS) $(TEST_TARGET)
	rm -rf vs_project

# Rule to generate Visual Studio project on Windows
generate_vs_project:
ifeq ($(UNAME_S),MINGW64_NT)
	mkdir -p vs_project
	cd vs_project && cmake -G "Visual Studio 16 2019" ..
	@echo "Visual Studio project generated in the 'vs_project' directory."
else
	@echo "Visual Studio project generation is only available on Windows."
endif

# Rule for tests
test: $(TEST_TARGET) test_java
	./$(TEST_TARGET)

# Rule to compile the test suite for C++
$(TEST_TARGET): $(TEST_OBJS)
	$(CC) $(CFLAGS) -o $@ $(TEST_OBJS) -lgtest -lgtest_main -pthread

# Test object files generation
%.o: %.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to compile and run Java tests using JUnit
test_java: $(JAVA_TEST_SRCS)
	@echo "Compiling Java test files..."
	javac -cp .:junit-4.13.2.jar:hamcrest-core-1.3.jar -d bin $(JAVA_TEST_SRCS)
	@echo "Running Java tests with JUnit..."
	java -cp ./bin:junit-4.13.2.jar:hamcrest-core-1.3.jar org.junit.runner.JUnitCore TestSample

.PHONY: clean generate_vs_project test test_java
