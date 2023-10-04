export BUILDOPT=build

SRCDIR=src
BINDIR=bin
ifeq ($(OS),Windows_NT)
	CC=x86_64-w64-mingw32-g++
	SFLAG=-static -static-libgcc -static-libstdc++
    ifeq ($(BUILDOPT),prepare)
	    BINDIR:=$(BINDIR)/windows
    endif
else
    UNAME_S:=$(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    	CC=g++
    	SFLAG=-static -static-libgcc -static-libstdc++
        ifeq ($(BUILDOPT),prepare)
		    BINDIR:=$(BINDIR)/linux
	    endif
    endif
    ifeq ($(UNAME_S),Darwin)
    	CC=g++
    	SFLAG=
        ifeq ($(BUILDOPT),prepare)
		    BINDIR:=$(BINDIR)/osx
	    endif
    endif
endif

VPATH=$(SRCDIR):$(SRCDIR)/tArray:$(SRCDIR)/Geometry:$(SRCDIR)/tList:$(SRCDIR)/tMatrix:\
	$(SRCDIR)/tMeshList:$(SRCDIR)/tPtrList:$(SRCDIR)/tOutput:$(SRCDIR)/tMesh:$(SRCDIR)/errors:\
    $(SRCDIR)/Predicates:$(SRCDIR)/Erosion:$(SRCDIR)/MeshElements:$(SRCDIR)/Mathutil:\
    $(SRCDIR)/tIDGenerator:$(SRCDIR)/tInputFile:$(SRCDIR)/tLNode:$(SRCDIR)/tRunTimer:\
    $(SRCDIR)/tStreamMeander:$(SRCDIR)/tStreamMeander:$(SRCDIR)/tStorm:$(SRCDIR)/tStreamNet:\
    $(SRCDIR)/tUplift:$(SRCDIR)/tFloodplain:$(SRCDIR)/tEolian:$(SRCDIR)/tVegetation:\
    $(SRCDIR)/tListInputData:$(SRCDIR)/tStratGrid:$(SRCDIR)/tLithologyManager:\
    $(SRCDIR)/tOption:$(SRCDIR)/tTimeSeries:$(SRCDIR)/tWaterSedTracker:$(SRCDIR)/ChildInterface

OBJS= \
	errors.o \
	predicates.o \
	globalFns.o \
	erosion.o \
	meshElements.o \
	mathutil.o \
	tIDGenerator.o \
	tInputFile.o \
	tLNode.o \
	tRunTimer.o \
	tStreamMeander.o \
	meander.o \
	tStorm.o \
	tStreamNet.o \
	tUplift.o \
	tFloodplain.o \
	tEolian.o \
	tVegetation.o \
	tListInputData.o \
	tStratGrid.o \
	tLithologyManager.o \
	tOption.o \
	tTimeSeries.o \
	ParamMesh_t.o \
	TipperTriangulator.o \
	TipperTriangulatorError.o \
	tWaterSedTracker.o \
	childInterface.o \
	childDriver.o

DEPS= \
	Classes.h \
	Definitions.h \
	geometry.h \
	Inclusions.h \
	compiler.h \
	tArray.h \
	tArray.cpp \
	tArray2.h \
	tList.h \
	tListFwd.h \
	tMatrix.h \
	heapsort.h \
	tMesh.h \
	tMesh.cpp \
	tMesh2.cpp \
	tMeshList.h \
	tOutput.h \
	tOutput.cpp \
	tPtrList.h \
	trapfpe.h

PROG=child


all: $(BINDIR) $(PROG)

$(BINDIR):
	mkdir -p $@

$(PROG): $(OBJS)
	$(CC) -pedantic -Wall -W -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -g -O3 -mtune=native $(SFLAG) $(addprefix $(BINDIR)/, $(OBJS)) -o $(BINDIR)/$@
	$(RM) $(addprefix $(BINDIR)/, $(OBJS))

.SECONDEXPANSION:
%.o: %.cpp $$(wildcard $$*.h) $(DEPS)
	$(CC) -pedantic -Wall -W -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -g -O3 -mtune=native -c $< -o $(BINDIR)/$@

clean:
	$(RM) $(BINDIR)/$(PROG)
