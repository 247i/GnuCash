#
# Configuration file for using the XML library in GNOME applications
#
prefix="/c/gcdev64/gnucash/releases/inst"
exec_prefix="${prefix}"
libdir="${exec_prefix}/lib"
includedir="${prefix}/include"

XMLSEC_LIBDIR="${exec_prefix}/lib"
XMLSEC_INCLUDEDIR=" -D__XMLSEC_FUNCTION__=__func__   -DXMLSEC_NO_GOST=1 -DXMLSEC_NO_GOST2012=1 -DXMLSEC_DL_LIBLTDL=1 -I${prefix}/include/xmlsec1   -IC:/gcdev64/msys2/mingw32/include/libxml2  -IC:/gcdev64/msys2/mingw32/include -IC:/gcdev64/msys2/mingw32/include/libxml2   -DXMLSEC_CRYPTO_MSCRYPTO=1"
XMLSEC_LIBS="-L${exec_prefix}/lib -lxmlsec1-mscrypto -lxmlsec1 -lltdl  -LC:/gcdev64/msys2/mingw32/lib -lxml2  -LC:/gcdev64/msys2/mingw32/lib -lxslt -lz -llzma -liconv -lws2_32 -lxml2   -lcrypt32"
MODULE_VERSION="xmlsec-1.2.32-mscrypto"

