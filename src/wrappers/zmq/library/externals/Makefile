XML=zmq.gcc-xml
HEADER=plugin/c/zmq_liberty.h
HEADERS=/usr/include/zmq.h

wrappers: $(XML)
	wrappers-generator --local  $(XML) $(HEADERS)

## Previous versions used
## `pkg-config --cflags-only-I libzmq| cut -c 3- |tr --delete  '[:space:]' `/zmq.h 
## to Pick the included directories from the compilation flags, hoping
## that only one is given, cut from the third character, skipping the '-I'
## remove all space characters then add /zmq.h 

## Since it does not work reliably I now assume that the library is installed in usual places.

$(XML): 
	pkg-config --exists libzmq --atleast-version=2.1.9
	gccxml `pkg-config --cflags libzmq` $(HEADER) -fxml=$(XML)




