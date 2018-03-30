VERSION = 6.1

# PREFIX = /usr/local
PREFIX = ${HOME}/usr/local
MANPREFIX = ${PREFIX}/share/man

# Linux / OpenBSD
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft

# Linux
FREETYPEINC = /usr/include/freetype2
# OpenBSD
#FREETYPEINC = ${X11INC}/freetype2

INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 -lXext ${XINERAMALIBS} ${FREETYPELIBS}

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = -s ${LIBS}

# linux
CC = gcc -O3 -pipe -std=c99 -fstack-protector-all -fpie
# openbsd
#CC = clang -O3 -pipe -std=c99 -fstack-protector-all -fpie -Wl,-pie -Wl,-z,relro

