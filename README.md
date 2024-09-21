# GCJ Debian Project

This project is a cross-platform (Linux and Windows) compiler and testing suite designed for C++, Java, and future expansions to other languages. The project is built using `make`, supports GoogleTest for C++ tests, and JUnit for Java tests.

## Prerequisites

### Linux:
- GCC and G++
- Java (JDK 8+)
- GoogleTest (`sudo apt install libgtest-dev`)
- JUnit (`junit-4.13.2.jar` and `hamcrest-core-1.3.jar`)

### Windows (MSYS2):
- `mingw-w64-x86_64-gcc`
- `mingw-w64-x86_64-gcc-c++`
- Java (JDK 8+)
- JUnit (`junit-4.13.2.jar` and `hamcrest-core-1.3.jar`)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/gcj-debian.git
   cd gcj-debian
