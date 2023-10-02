export BUILDOPT=prepare

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
		    BINDIR := $(BINDIR)/osx
	    endif
    endif
endif

VPATH=$(SRCDIR):$(SRCDIR)/tArray:$(SRCDIR)/tOutput:$(SRCDIR)/tMesh:$(SRCDIR)/errors:\
	$(SRCDIR)/Predicates:$(SRCDIR)/Erosion:$(SRCDIR)/MeshElements:$(SRCDIR)/Mathutil:\
	$(SRCDIR)/tIDGenerator:$(SRCDIR)/tInputFile:$(SRCDIR)/tLNode:$(SRCDIR)/tRunTimer:\
	$(SRCDIR)/tStreamMeander:$(SRCDIR)/tStreamMeander:$(SRCDIR)/tStorm:$(SRCDIR)/tStreamNet:\
 	$(SRCDIR)/tUplift:$(SRCDIR)/tFloodplain:$(SRCDIR)/tEolian:$(SRCDIR)/tVegetation:\
 	$(SRCDIR)/tListInputData:$(SRCDIR)/tStratGrid:$(SRCDIR)/tLithologyManager:\
 	$(SRCDIR)/tOption:$(SRCDIR)/tTimeSeries:$(SRCDIR)/tMesh:$(SRCDIR)/tMesh:\
 	$(SRCDIR)/tMesh:$(SRCDIR)/tWaterSedTracker:$(SRCDIR)/ChildInterface:$(SRCDIR)/ChildInterface

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

HEADERS= \
	$(SRCDIR)/Classes.h \
	$(SRCDIR)/Definitions.h \
	$(SRCDIR)/Geometry/geometry.h \
	$(SRCDIR)/Inclusions.h \
	$(SRCDIR)/compiler.h \
	$(SRCDIR)/tArray/tArray.h \
	$(SRCDIR)/tArray/tArray2.h \
	$(SRCDIR)/tList/tList.h \
	$(SRCDIR)/tList/tListFwd.h \
	$(SRCDIR)/tMatrix/tMatrix.h \
	$(SRCDIR)/tMesh/heapsort.h \
	$(SRCDIR)/tMesh/tMesh.h \
	$(SRCDIR)/tMeshList/tMeshList.h \
	$(SRCDIR)/tOutput/tOutput.h \
	$(SRCDIR)/tPtrList/tPtrList.h \
	$(SRCDIR)/trapfpe.h \
	$(SRCDIR)/errors/errors.h \
	$(SRCDIR)/Predicates/predicates.h \
	$(SRCDIR)/globalFns.h \
	$(SRCDIR)/Erosion/erosion.h \
	$(SRCDIR)/MeshElements/meshElements.h \
	$(SRCDIR)/Mathutil/mathutil.h \
	$(SRCDIR)/tIDGenerator/tIDGenerator.h \
	$(SRCDIR)/tInputFile/tInputFile.h \
	$(SRCDIR)/tLNode/tLNode.h \
	$(SRCDIR)/tRunTimer/tRunTimer.h \
	$(SRCDIR)/tStreamMeander/tStreamMeander.h \
	$(SRCDIR)/tStreamMeander/meander.h \
	$(SRCDIR)/tStorm/tStorm.h \
	$(SRCDIR)/tStreamNet/tStreamNet.h \
	$(SRCDIR)/tUplift/tUplift.h \
	$(SRCDIR)/tFloodplain/tFloodplain.h \
	$(SRCDIR)/tEolian/tEolian.h \
	$(SRCDIR)/tVegetation/tVegetation.h \
	$(SRCDIR)/tListInputData/tListInputData.h \
	$(SRCDIR)/tStratGrid/tStratGrid.h \
	$(SRCDIR)/tLithologyManager/tLithologyManager.h \
	$(SRCDIR)/tOption/tOption.h \
	$(SRCDIR)/tTimeSeries/tTimeSeries.h \
	$(SRCDIR)/tMesh/ParamMesh_t.h \
	$(SRCDIR)/tMesh/TipperTriangulator.h \
	$(SRCDIR)/tWaterSedTracker/tWaterSedTracker.h \
	$(SRCDIR)/ChildInterface/childInterface.h

SOURCES= \
	$(SRCDIR)/tArray/tArray.cpp \
	$(SRCDIR)/tOutput/tOutput.cpp \
	$(SRCDIR)/tMesh/tMesh.cpp \
	$(SRCDIR)/tMesh/tMesh2.cpp

PROG = child


all: $(BINDIR) $(PROG)

$(BINDIR):
	mkdir -p $@

$(PROG): $(OBJS)
	$(CC) -pedantic -Wall -W -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -g -O3 -mtune=native $(SFLAG) $(addprefix $(BINDIR)/, $(OBJS)) -o $(BINDIR)/$@
	$(RM) $(addprefix $(BINDIR)/, $(OBJS))

%.o: %.cpp $(HEADERS) $(SOURCES)
	$(CC) -pedantic -Wall -W -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align -g -O3 -mtune=native -c $< -o $(BINDIR)/$@

clean:
	$(RM) $(BINDIR)/$(PROG)
