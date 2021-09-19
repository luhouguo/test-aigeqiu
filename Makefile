#
# Created by luhouguo on 2021/9/19.
#

CROSS_COMPILE =

AS		= $(CROSS_COMPILE)as
LD		= $(CROSS_COMPILE)ld
CC		= $(CROSS_COMPILE)gcc
CPP		= $(CC) -E
AR		= $(CROSS_COMPILE)ar
NM		= $(CROSS_COMPILE)nm

STRIP		= $(CROSS_COMPILE)strip
OBJCOPY		= $(CROSS_COMPILE)objcopy
OBJDUMP		= $(CROSS_COMPILE)objdump

export AS LD CC CPP AR NM
export STRIP OBJCOPY OBJDUMP

CFLAGS := -Wall -O2 -g
CFLAGS += -I $(shell pwd)/lib
#CFLAGS += -I $(shell pwd)/webserver
CFLAGS += -I $(shell pwd)/

LDFLAGS := -lm -lpthread

export CFLAGS LDFLAGS

TOPDIR := $(shell pwd)
export TOPDIR

TARGET := TestHello

obj-y += lib/
#obj-y += webserver/
obj-y += main.o

all :
	make -C ./ -f $(TOPDIR)/Makefile.build
	$(CC) -o $(TARGET) built-in.o $(LDFLAGS)

clean:
#	rm -f $(shell find -name "*.o")
#	rm -f $(shell find -name "*.d")
	rm -f *.o
#	rm -f *.d
	rm -f $(TARGET)