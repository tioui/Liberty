## To avoid an Ubuntu
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
##GCCXML_COMPILER=gcc-4.2

XML=libxml2.gcc-xml
HEADER=libxml2-liberty.h
HEADERS := $(shell pkg-config --cflags-only-I libxml-2.0| cut -c 3- |tr --delete  '[:space:]' )/libxml/*
## The previous variable is computed from the output of pkg-config, removing the "-I" 

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS) 

$(XML): $(HEADER) 
	gccxml `pkg-config --cflags libxml-2.0` $(HEADER) -fxml=$(XML)

