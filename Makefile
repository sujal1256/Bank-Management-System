# Compiler
CC = gcc

# Directories
SRC_DIR = src
BIN_DIR = bin

# Source files
MAIN_SRC = $(SRC_DIR)/main.c
ADMIN_SRC = $(SRC_DIR)/admin.c
CUSTOMER_SRC = $(SRC_DIR)/customer.c

# Detect platform (Windows, Linux, or macOS)
ifeq ($(OS),Windows_NT)
    RM = del /Q
    MAIN_TARGET = $(BIN_DIR)\main.exe
    ADMIN_TARGET = $(BIN_DIR)\admin.exe
    CUSTOMER_TARGET = $(BIN_DIR)\customer.exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        RM = rm -f
        MAIN_TARGET = $(BIN_DIR)/main.out
        ADMIN_TARGET = $(BIN_DIR)/admin.out
        CUSTOMER_TARGET = $(BIN_DIR)/customer.out
    endif
    ifeq ($(UNAME_S),Darwin) # macOS
        RM = rm -f
        MAIN_TARGET = $(BIN_DIR)/main.out
        ADMIN_TARGET = $(BIN_DIR)/admin.out
        CUSTOMER_TARGET = $(BIN_DIR)/customer.out
    endif
endif

# Default target
all: $(MAIN_TARGET) $(ADMIN_TARGET) $(CUSTOMER_TARGET)

# Rule to build main target
$(MAIN_TARGET): $(MAIN_SRC)
	$(CC) $(MAIN_SRC) -o $(MAIN_TARGET)

# Rule to build admin target
$(ADMIN_TARGET): $(ADMIN_SRC)
	$(CC) $(ADMIN_SRC) -o $(ADMIN_TARGET)

# Rule to build customer target
$(CUSTOMER_TARGET): $(CUSTOMER_SRC)
	$(CC) $(CUSTOMER_SRC) -o $(CUSTOMER_TARGET)

# Run the main program
run: all
	$(MAIN_TARGET)

# Clean the build
clean:
	$(RM) $(MAIN_TARGET) $(ADMIN_TARGET) $(CUSTOMER_TARGET)
