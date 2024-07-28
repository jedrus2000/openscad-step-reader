CXX = g++

CPPFLAGS = -I/usr/include/opencascade
CXXFLAGS = -std=c++11 -g -O0
LDFLAGS = -L/usr/lib
LDLIBS = -lTKXDESTEP -lTKSTEP -lTKSTEP209 -lTKSTEPAttr -lTKXDEIGES -lTKXCAF -lTKBinXCAF -lTKXmlXCAF  \
         -lTKIGES -lTKSTEPBase -lTKXSBase -lTKSTL \
         -lTKStd -lTKStdL -lTKXml -lTKBin -lTKXmlL -lTKBinL -lTKCAF -lTKLCAF \
         -lTKCDF -lTKMeshVS -lTKOpenGl -lTKV3d -lTKService -lTKXMesh \
         -lTKOffset -lTKFeat -lTKFillet -lTKHLR -lTKBool -lTKBO -lTKMesh \
         -lTKPrim -lTKShHealing -lTKTopAlgo -lTKGeomAlgo -lTKBRep -lTKGeomBase -lTKG3d -lTKG2d \
         -lTKMath -lTKernel -lfreetype -lpthread -lrt -lstdc++ -ldl -lm


all: openscad-step-reader

openscad-step-reader: openscad-step-reader.o tessellation.o openscad-triangle-writer.o explore-shape.o
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@

openscad-step-reader.o: openscad-step-reader.cpp triangle.h
tessellation.o: tessellation.cpp tessellation.h triangle.h
openscad-triangle-writer.o: openscad-triangle-writer.cpp openscad-triangle-writer.h triangle.h
explore-shape.o: explore-shape.cpp explore-shape.h


.PHONY: clean
clean: \
    rm -f $(OBJS) openscad-step-reader
