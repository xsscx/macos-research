# Get the list of .cpp files
CPP_FILES := $(wildcard *.cpp)

# Compile all .cpp files
all: $(CPP_FILES)
	@echo "Listing all .cpp files:"
	@ls *.cpp
	@echo "Compiling .cpp files..."
	@for file in $(CPP_FILES); do \
		output_name=$$(basename $$file .cpp); \
		clang++ -g -fsanitize=address,undefined -o $$output_name $$file; \
	done

clean:
	@echo "Cleaning up..."
	@rm -f $(basename $(CPP_FILES))
