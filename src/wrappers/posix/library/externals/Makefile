## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
## export GCCXML_COMPILER = gcc-4.5

XML=posix.gcc-xml
HEADER=plugin/c/liberty-posix.h
HEADERS=/usr/include/fcntl.h \
	/usr/include/sys/mman.h \
	/usr/include/unistd.h \
    /usr/include/*/*

wrappers: $(XML)
	wrappers-generator --local $(XML) $(HEADERS)

$(XML): $(HEADER)
	gccxml $(HEADER) -fxml=$(XML)

## Ideally here we should make wrappers for include files not already wrapped in common wrapper cluster using a command like
## (gcc -M ../../../common/library/externals/plugin/c/standard-c-lib.h; gcc -M plugin/c/liberty-posix.h)|sort |uniq --repeated 
## i.e. print the dependecies of standard-c-lib.g and liberty-posix.h, sort
## them and leave only the lines that are not repeated. Too bad gcc insist putting
## more than one file on each line and using make syntax.... 

