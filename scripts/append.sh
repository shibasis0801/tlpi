function tlpi() {
    filename=$1
    gcc -std=c99 -D_XOPEN_SOURCE=600 -D_DEFAULT_SOURCE -g -I../lib -pedantic -Wall -W -Wmissing-prototypes -Wno-sign-compare -Wimplicit-fallthrough -Wno-unused-parameter    xattr_view.c ../libtlpi.a   -o xattr_view
}