export BUILDOPT=prepare

SRCDIR = src
BINDIR = bin
ifeq ($(OS),Windows_NT)
	CC=x86_64-w64-mingw32-g++
    SFLAG = -static
    ifeq ($(BUILDOPT),prepare)
	    BINDIR := $(BINDIR)/windows
    endif
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    	CC=g++
        SFLAG = -static
        ifeq ($(BUILDOPT),prepare)
		    BINDIR := $(BINDIR)/linux
	    endif
    endif
    ifeq ($(UNAME_S),Darwin)
    	CC=g++
        SFLAG = -static-libgcc -static-libstdc++
        ifeq ($(BUILDOPT),prepare)
		    BINDIR := $(BINDIR)/osx
	    endif
    endif
endif

OBJS= \
 	childDriver.o \
 	childInterface.o \
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
 	errors.o \
 	tFloodplain.o \
 	tEolian.o \
 	globalFns.o \
 	predicates.o \
 	tVegetation.o \
 	tListInputData.o \
 	tStratGrid.o \
 	tLithologyManager.o \
 	tOption.o \
 	tTimeSeries.o \
 	ParamMesh_t.o \
 	TipperTriangulator.o \
 	TipperTriangulatorError.o \
 	tWaterSedTracker.o

 SOURCES= \
 	$(SRCDIR)/ChildInterfacechildDriver.cpp \
 	$(SRCDIR)/ChildInterface/childInterface.cpp \
 	$(SRCDIR)/Erosion/erosion.cpp \
 	$(SRCDIR)/MeshElements/meshElements.cpp \
 	$(SRCDIR)/Mathutil/mathutil.cpp \
 	$(SRCDIR)/tIDGenerator/tIDGenerator.cpp \
 	$(SRCDIR)/tInputFile/tInputFile.cpp \
 	$(SRCDIR)/tLNode/tLNode.cpp \
 	$(SRCDIR)/tRunTimer/tRunTimer.cpp \
 	$(SRCDIR)/tStreamMeander/tStreamMeander.cpp \
 	$(SRCDIR)/tStreamMeander/meander.cpp \
 	$(SRCDIR)/tStorm/tStorm.cpp \
 	$(SRCDIR)/tStreamNet/tStreamNet.cpp \
 	$(SRCDIR)/tUplift/tUplift.cpp \
 	$(SRCDIR)/errors/errors.cpp \
 	$(SRCDIR)/tFloodplain/tFloodplain.cpp \
 	$(SRCDIR)/tEolian/tEolian.cpp \
 	$(SRCDIR)/globalFns.cpp \
 	$(SRCDIR)/Predicatespredicates.cpp \
 	$(SRCDIR)/tVegetation/tVegetation.cpp \
 	$(SRCDIR)/tListInputData/tListInputData.cpp \
 	$(SRCDIR)/tStratGrid/tStratGrid.cpp \
 	$(SRCDIR)/tLithologyManager/tLithologyManager.cpp \
 	$(SRCDIR)/tOption/tOption.cpp \
 	$(SRCDIR)/tTimeSeries/tTimeSeries.cpp \
 	$(SRCDIR)/tMesh/ParamMesh_t.cpp \
 	$(SRCDIR)/tMesh/TipperTriangulator.cpp \
 	$(SRCDIR)/tMesh/TipperTriangulatorError.cpp \
 	$(SRCDIR)/tWaterSedTracker/tWaterSedTracker.cpp

 HEADERS= \
 	$(SRCDIR)/ChildInterfacechildDriver.h \
 	$(SRCDIR)/ChildInterface/childInterface.h \
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
 	$(SRCDIR)/errors/errors.h \
 	$(SRCDIR)/tFloodplain/tFloodplain.h \
 	$(SRCDIR)/tEolian/tEolian.h \
 	$(SRCDIR)/globalFns.h \
 	$(SRCDIR)/Predicatespredicates.h \
 	$(SRCDIR)/tVegetation/tVegetation.h \
 	$(SRCDIR)/tListInputData/tListInputData.h \
 	$(SRCDIR)/tStratGrid/tStratGrid.h \
 	$(SRCDIR)/tLithologyManager/tLithologyManager.h \
 	$(SRCDIR)/tOption/tOption.h \
 	$(SRCDIR)/tTimeSeries/tTimeSeries.h \
 	$(SRCDIR)/tMesh/ParamMesh_t.h \
 	$(SRCDIR)/tMesh/TipperTriangulator.h \
 	$(SRCDIR)/tMesh/TipperTriangulatorError.h \
 	$(SRCDIR)/tWaterSedTracker/tWaterSedTracker.h

PROG = child

all: $(BINDIR) $(PROG)

$(BINDIR):
	mkdir -p $@

$(PROG): $(HEADERS) $(SOURCES)
	$(CC) $(SFLAG) $(SOURCES) -o $(BINDIR)/$@









