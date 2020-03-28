
function tcc() {
    filename=$1
    output=$(echo $filename | awk '{split($0, a, ".");print a[1]}').o
    gcc -std=c99 -D_XOPEN_SOURCE=600 -D_DEFAULT_SOURCE -g -I$TLPI_HDR -pedantic -Wall -W -Wmissing-prototypes -Wno-sign-compare -Wimplicit-fallthrough -Wno-unused-parameter $filename $TLPI_LIB -o $output    
}
