#
# Makefile for CombinationOfPiecewiseGeodesicPaths
# Compiler: gcc
# Command line: make
#
CC = g++
CPPFLAGS = -DNDEBUG -O3
LD = g++
LDFLAGS = -DNDEBUG -O3
SRCS = arrayndfloat.cpp histogram.cpp image2d.cpp main.cpp path.cpp piecewisegeodesiccombination.cpp voronoigraph.cpp
FINAL_TARGET = combpaths
INCLUDE_DIR = # -I./external/include # Uncomment if using your own build of libpng, zlib and libjpeg
LIB_DIR = # -L./external/lib/gcc # Uncomment if using your own build of libpng, zlib and libjpeg
LIBS = -lpng -lz -ljpeg 

default: $(FINAL_TARGET)

$(FINAL_TARGET): $(SRCS:%.cpp=%.o)
	$(LD) $+ -o $@ $(LDFLAGS) $(LIB_DIR) $(LIBS)

%.o: %.cpp
	$(CC) -c $(CPPFLAGS) $(INCLUDE_DIR) $< -o $@

clean:
	rm -f *.o $(FINAL_TARGET)

