PT = ../Code
CXX = g++
#
# -O is necessary for -Wuninitialized to be on
# -Weffc++ -fmessage-length=0 gives useful but noisy warnings
WARNINGFLAGS = -pedantic -Wall -W \
	-Wwrite-strings \
	-Wpointer-arith -Wcast-qual -Wcast-align

# recent versions of Linux use new style casts in their headers
WARNINGFLAGS += -Wold-style-cast

# gcc 2.x does not put the standard C++ headers in the namespace "std"
# In such a case, remove the comment of the following line.
#WARNINGFLAGS += -DHAVE_NO_NAMESPACE

# -march=i686: generates code for pentiumpro and later
# -march=pentium3: generates code for pentium III and later
#ARCH := -march=i686
ARCH := -march=pentium3
# optimise
CFLAGS = $(WARNINGFLAGS) -g -O2 $(ARCH) -c
LDFLAGS = $(WARNINGFLAGS) -g -O2 $(ARCH)
# no optimisation, build is faster
#CFLAGS = $(WARNINGFLAGS) -g $(ARCH) -c
#LDFLAGS = $(WARNINGFLAGS) -g $(ARCH)
LIBS =
EXENAME = child

OBJECTS = childmain.o erosion.o meshElements.o mathutil.o \
 tInputFile.o tLNode.o tRunTimer.o tStreamMeander.o meander.o \
tStorm.o tStreamNet.o tUplift.o errors.o tFloodplain.o \
tEolian.o globalFns.o predicates.o tVegetation.o tListInputData.o \
tTimeSeries.o \
ParamMesh_t.o TipperTriangulator.o TipperTriangulatorError.o

all : $(EXENAME)
.PHONY : all clean

$(EXENAME): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(OBJECTS) -o $@ $(LIBS)

erosion.o: $(PT)/Erosion/erosion.cpp
	$(CXX) $(CFLAGS) $(PT)/Erosion/erosion.cpp

meshElements.o: $(PT)/MeshElements/meshElements.cpp
	$(CXX) $(CFLAGS) $(PT)/MeshElements/meshElements.cpp

mathutil.o: $(PT)/Mathutil/mathutil.cpp
	$(CXX) $(CFLAGS) $(PT)/Mathutil/mathutil.cpp

tInputFile.o: $(PT)/tInputFile/tInputFile.cpp
	$(CXX) $(CFLAGS) $(PT)/tInputFile/tInputFile.cpp

tLNode.o: $(PT)/tLNode/tLNode.cpp
	$(CXX) $(CFLAGS) $(PT)/tLNode/tLNode.cpp

tListInputData.o: $(PT)/tListInputData/tListInputData.cpp
	$(CXX) $(CFLAGS) $(PT)/tListInputData/tListInputData.cpp

tRunTimer.o: $(PT)/tRunTimer/tRunTimer.cpp
	$(CXX) $(CFLAGS) $(PT)/tRunTimer/tRunTimer.cpp

tStorm.o: $(PT)/tStorm/tStorm.cpp
	$(CXX) $(CFLAGS) $(PT)/tStorm/tStorm.cpp

tTimeSeries.o:  $(PT)/tTimeSeries/tTimeSeries.cpp
	$(CXX) $(CFLAGS) $(PT)/tTimeSeries/tTimeSeries.cpp

tStreamNet.o: $(PT)/tStreamNet/tStreamNet.cpp
	$(CXX) $(CFLAGS) $(PT)/tStreamNet/tStreamNet.cpp

tUplift.o: $(PT)/tUplift/tUplift.cpp
	$(CXX) $(CFLAGS) $(PT)/tUplift/tUplift.cpp

errors.o: $(PT)/errors/errors.cpp
	$(CXX) $(CFLAGS) $(PT)/errors/errors.cpp

tFloodplain.o: $(PT)/tFloodplain/tFloodplain.cpp
	$(CXX) $(CFLAGS) $(PT)/tFloodplain/tFloodplain.cpp

tEolian.o: $(PT)/tEolian/tEolian.cpp
	$(CXX) $(CFLAGS) $(PT)/tEolian/tEolian.cpp

ParamMesh_t.o: $(PT)/tMesh/ParamMesh_t.cpp
	$(CXX) $(CFLAGS) $(PT)/tMesh/ParamMesh_t.cpp

TipperTriangulator.o: $(PT)/tMesh/TipperTriangulator.cpp
	$(CXX) $(CFLAGS) $(PT)/tMesh/TipperTriangulator.cpp

TipperTriangulatorError.o: $(PT)/tMesh/TipperTriangulatorError.cpp
	$(CXX) $(CFLAGS) $(PT)/tMesh/TipperTriangulatorError.cpp

globalFns.o: $(PT)/globalFns.cpp
	$(CXX) $(CFLAGS) $(PT)/globalFns.cpp

predicates.o: $(PT)/Predicates/predicates.cpp
	$(CXX) $(CFLAGS) $(PT)/Predicates/predicates.cpp

tVegetation.o: $(PT)/tVegetation/tVegetation.cpp
	$(CXX) $(CFLAGS) $(PT)/tVegetation/tVegetation.cpp

tStreamMeander.o: $(PT)/tStreamMeander/tStreamMeander.cpp
	$(CXX) $(CFLAGS) $(PT)/tStreamMeander/tStreamMeander.cpp

meander.o: $(PT)/tStreamMeander/meander.cpp
	$(CXX) $(CFLAGS) $(PT)/tStreamMeander/meander.cpp

childmain.o: $(PT)/childmain.cpp
	$(CXX) $(CFLAGS) $(PT)/childmain.cpp

clean::
	rm -f $(EXENAME)
	rm -f *.o

# dependencies: headers and template implementation files.
# use, for instance:
# find ${CHILDCODE} -name '*.h' | xargs grep -n -e include | grep '\.cpp'
HFILES = \
	$(PT)/Classes.h \
	$(PT)/Definitions.h \
	$(PT)/Erosion/erosion.h \
	$(PT)/Geometry/geometry.h \
	$(PT)/Inclusions.h \
	$(PT)/Mathutil/mathutil.h \
	$(PT)/MeshElements/meshElements.h \
	$(PT)/Predicates/predicates.h \
	$(PT)/compiler.h \
	$(PT)/errors/errors.h \
	$(PT)/globalFns.h \
	$(PT)/tArray/tArray.cpp \
	$(PT)/tArray/tArray.h \
	$(PT)/tEolian/tEolian.h \
	$(PT)/tFloodplain/tFloodplain.h \
	$(PT)/tInputFile/tInputFile.h \
	$(PT)/tLNode/tLNode.h \
	$(PT)/tList/tList.h \
	$(PT)/tListInputData/tListInputData.h \
	$(PT)/tMatrix/tMatrix.h \
	$(PT)/tMesh/ParamMesh_t.h \
	$(PT)/tMesh/TipperTriangulator.h \
	$(PT)/tMesh/heapsort.h \
	$(PT)/tMesh/tMesh.cpp \
	$(PT)/tMesh/tMesh.h \
	$(PT)/tMesh/tMesh2.cpp \
	$(PT)/tMeshList/tMeshList.h \
	$(PT)/tOutput/tOutput.cpp \
	$(PT)/tOutput/tOutput.h \
	$(PT)/tPtrList/tPtrList.h \
	$(PT)/tRunTimer/tRunTimer.h \
	$(PT)/tStorm/tStorm.h \
	$(PT)/tStreamMeander/meander.h \
	$(PT)/tStreamMeander/tStreamMeander.h \
	$(PT)/tStreamNet/tStreamNet.h \
	$(PT)/tTimeSeries/tTimeSeries.h \
	$(PT)/tUplift/tUplift.h \
	$(PT)/tVegetation/tVegetation.h \
	$(PT)/trapfpe.h

ParamMesh_t.o: $(HFILES)
TipperTriangulator.o : $(HFILES)
TipperTriangulatorError.o : $(HFILES)
childmain.o : $(HFILES)
erosion.o: $(HFILES)
errors.o: $(HFILES)
globalFns.o: $(HFILES)
mathutil.o: $(HFILES)
meander.o: $(HFILES)
meshElements.o: $(HFILES)
predicates.o: $(HFILES)
tEolian.o: $(HFILES)
tFloodplain.o: $(HFILES)
tInputFile.o: $(HFILES)
tLNode.o: $(HFILES)
tListInputData.o: $(HFILES)
tRunTimer.o: $(HFILES)
tStorm.o : $(HFILES)
tStreamMeander.o: $(HFILES)
tStreamNet.o: $(HFILES)
tTimeSeries.o : $(HFILES)
tUplift.o: $(HFILES)
tVegetation.o: $(HFILES)
