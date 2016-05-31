#!/bin/sh
# git clone git://anongit.mindrot.org/openssh.git && cd openssh
# git clone https://android.googlesource.com/platform/external/openssh & cd openssh
export DEV_PREFIX=/opt
export ANDROID_NDK=${DEV_PREFIX}/ndk
export CROSS_COMPILE= #arm-linux-androideabi
export ANDROID_PREFIX=/tmp/chain
export SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
export CROSS_PATH=${ANDROID_PREFIX}/bin/arm-linux-androideabi
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
#export LD=${CROSS_PATH}-ld
export LD=${CROSS_PATH}-gcc
export RANLIB=${CROSS_PATH}-ranlib
export PREFIX=/data/local/tmp
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
#CFLAGS="-UHAVE_LOCALE_H --sysroot=${SYSROOT} -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -I${DEV_PREFIX}/bionic/libc "
#CPPFLAGS="${CFLAGS}"
#LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib"
# -UHAVE_GETRRSETBYNAME 
#-static
export ARCH_FLAGS=" -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16"
#export ARCH_LINK="-march=armv7-a -Wl,--fix-cortex-a8"
#export ARCH_LINK="-march=armv7-a -lc -nostartfiles -lcrypto "
export ARCH_LINK="-march=armv7-a -lc -ldl -nostartfiles "
#--with-ldflags="-lcrypt -march=armv7-a -lc -nostartfiles" \
#-DBROKEN_GETADDRINFO \
#-DBIND_4_COMPAT \
#-UHAVE_ARC4RANDOM \
#-UHAVE_U_CHAR \
#-UHAVE_GETRRSETBYNAME \
#-DHAVE_SYS_STATFS_H \
#-DHAVE_MBLEN \
#-DSANDBOX_RLIMIT \
#-DMISSING_HOWMANY \
#-DMISSING_FD_MASK \
#-DHAVE__RES_EXTERN \
#-DHAVE_UTMPXNAME \
#-DHAVE_UPDWTMP \
#-DHAVE_TYPE_IN_UTMPX \
#-DHAVE_TV_IN_UTMPX \
#-DHAVE_SYS_NERR \
#-DHAVE_SYS_ERRLIST \
#-DHAVE_SYS_DIR_H \
#-DHAVE_SIGVEC \
#-DHAVE_SETUTXENT \
#-DHAVE_PUTUTXLINE \
#-DHAVE_LOGWTMP \
#-DHAVE_LOGOUT \
#-DHAVE_LIBNSL \
#-DHAVE_IN_ADDR_T \
#-DHAVE_ID_IN_UTMPX \
#-DHAVE_HOST_IN_UTMPX \
#-DHAVE_HEADER_AD \
#-DHAVE_GLOB_H \
#-DHAVE_GLOB \
#-DHAVE_GETUTXLINE \
#-DHAVE_GETUTXID \
#-DHAVE_GETUTXENT \
#-DHAVE_GETUTLINE \
#-DHAVE_GETUTID \
#-DHAVE_GETTTYENT \
#-DHAVE_GETPAGESIZE \
#-DHAVE_ENDUTXENT \
#-DHAVE_DEV_PTMX \
#-DHAVE_ADDR_V6_IN_UTMPX \
#-DHAVE_ADDR_IN_UTMPX \
#-DHAS_SHADOW_EXPIRE \
#-DGLOB_HAS_ALTDIRFUNC \
#-I./openbsd-compat \
#-shared \
#-fpic \
#-ffunction-sections \
#-funwind-tables \
#-fstack-protector \
#-fno-strict-aliasing \
#-finline-limit=64 \

export CFLAGS="\
${ARCH_FLAGS} \
-I${ANDROID_PREFIX}/include \
-I${SYSROOT}/usr/include \
-I./openbsd-compat \
-I../openbsd-compat \
-I${DEV_PREFIX}/bionic/libc/include \
"
export CPPFLAGS="${CFLAGS}"
export CXXFLAGS="${ARCH_FLAGS} -fpic -ffunction-sections -funwind-tables -fstack-protector -fno-strict-aliasing -finline-limit=64 -frtti -fexceptions "
#export LDFLAGS="${ARCH_LINK} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib "
export LDFLAGS="${ARCH_LINK} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib  "
export SSH_PRIVSEP_USER="shell"
# autoreconf
# LIBS="-lc -ldl -lm" 
# --with-ldns 
#ndk-build 
if [ 1 -eq 1 ]; then
#ac_cv_search_getrrsetbyname=yes 
#ac_fn_c_try_link=no \
#with_openssl_header_check=no \
#{ADP} ------ ADDED ARC4RANDOM --- ALMOST DONE BEFORE THAT -- had libssh.a
#ac_cv_func_arc4random=yes \
#ac_cv_func_arc4random_buf=yes \
#ac_cv_func_arc4random_stir=yes \
#ac_cv_func_arc4random_uniform=yes \
#--with-ldflags="-lcrypt -march=armv7-a -lc -nostartfiles" \
#--with-sandbox=no \
#--with-ldflags=-lcrypt \
#--with-md5-passwords \
#
autoreconf && make distclean
SSH_PRIVSEP_USER="shell" \
CROSS_COMPILE=arm-eabi- \
CPPFLAGS="${CPPFLAGS}" \
LDFLAGS="${LDFLAGS}" \
CFLAGS="${CFLAGS}" \
ac_cv_lib_z_deflate=yes \
ac_cv_header_sys_un_h=yes \
ac_cv_search_getrrsetbyname=no \
ac_cv_func_getaddrinfo=no \
ac_cv_type_socklen_t=yes \
use_toolchain_hardening=0 \
use_stack_protector=0 \
./configure \
--with-sandbox=no \
--without-stackprotect \
--without-hardening \
--disable-libutil \
--prefix=/data/local/tmp \
--without-shadow \
--disable-etc-default-login \
--disable-utmp \
--disable-utmpx \
--disable-wtmp \
--disable-wtmpx \
--disable-pututline \
--disable-pututxline \
--disable-etc-default-login \
--with-default-path=/data/local/tmp/xbin:/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin \
--sysconfdir=/data/local/tmp/etc \
--with-openssl \
--bindir=/data/local/tmp/xbin \
--sbindir=/data/local/tmp/xbin \
--with-pid-dir=/data/local/tmp/var \
--with-prngd-socket=/dev/urandom \
--with-privsep-path=/data/local/tmp/var/empty \
--localstatedir=/data/local/tmp/var \
--host=arm-linux-androideabi \
--with-zlib=/data/local/tmp/lib && make V=1 # && make install
fi

#--with-ssl-dir=/data/local/tmp/ssl \
#--without-openssl-header-check \
#
#--with-zlib=/data/local/tmp/lib && make V=1 # && make install
#--host=arm-linux 
#
#   -h, --help              display this help and exit
#       --help=short        display options specific to this package
#       --help=recursive    display the short help of all the included packages
#   -V, --version           display version information and exit
#   -q, --quiet, --silent   do not print \`checking ...' messages
#       --cache-file=FILE   cache test results in FILE [disabled]
#   -C, --config-cache      alias for \`--cache-file=config.cache'
#   -n, --no-create         do not create output files
#       --srcdir=DIR        find the sources in DIR [configure dir or \`..']
#   --prefix=PREFIX         install architecture-independent files in PREFIX
#   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
# an installation prefix other than \`$ac_default_prefix' using \`--prefix',
# for instance \`--prefix=\$HOME'.
#   --bindir=DIR            user executables [EPREFIX/bin]
#   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#   --libexecdir=DIR        program executables [EPREFIX/libexec]
#   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#   --libdir=DIR            object code libraries [EPREFIX/lib]
#   --includedir=DIR        C header files [PREFIX/include]
#   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#   --infodir=DIR           info documentation [DATAROOTDIR/info]
#   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#   --mandir=DIR            man documentation [DATAROOTDIR/man]
#   --docdir=DIR            documentation root [DATAROOTDIR/doc/openssh]
#   --htmldir=DIR           html documentation [DOCDIR]
#   --dvidir=DIR            dvi documentation [DOCDIR]
#   --pdfdir=DIR            pdf documentation [DOCDIR]
#   --psdir=DIR             ps documentation [DOCDIR]
#   --build=BUILD     configure for building on BUILD [guessed]
#   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --disable-largefile     omit support for large files
#   --disable-strip         Disable calling strip(1) on install
#   --disable-etc-default-login Disable using PATH from /etc/default/login no
#   --disable-lastlog       disable use of lastlog even if detected no
#   --disable-utmp          disable use of utmp even if detected no
#   --disable-utmpx         disable use of utmpx even if detected no
#   --disable-wtmp          disable use of wtmp even if detected no
#   --disable-wtmpx         disable use of wtmpx even if detected no
#   --disable-libutil       disable use of libutil (login() etc.) no
#   --disable-pututline     disable use of pututline() etc. (uwtmp) no
#   --disable-pututxline    disable use of pututxline() etc. (uwtmpx) no
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --without-openssl       Disable use of OpenSSL; use only limited internal crypto **EXPERIMENTAL**
#   --with-ssh1             Enable support for SSH protocol 1
#   --without-stackprotect  Don't use compiler's stack protection
#   --without-hardening     Don't use toolchain hardening flags
#   --without-rpath         Disable auto-added -R linker paths
#   --with-cflags           Specify additional flags to pass to compiler
#   --with-cppflags         Specify additional flags to pass to preprocessor
#   --with-ldflags          Specify additional flags to pass to linker
#   --with-libs             Specify additional libraries to link with
#   --with-Werror           Build main code with -Werror
#   --with-solaris-contracts Enable Solaris process contracts (experimental)
#   --with-solaris-projects Enable Solaris projects (experimental)
#   --with-solaris-privs    Enable Solaris/Illumos privileges (experimental)
#   --with-osfsia           Enable Digital Unix SIA
#   --with-zlib=PATH        Use zlib in PATH
#   --without-zlib-version-check Disable zlib version check
#   --with-skey[=PATH]      Enable S/Key support (optionally in PATH)
#   --with-ldns[=PATH]      Use ldns for DNSSEC support (optionally in PATH)
#   --with-libedit[=PATH]   Enable libedit support for sftp
#   --with-audit=module     Enable audit support (modules=debug,bsm,linux)
#   --with-pie              Build Position Independent Executables if possible
#   --with-ssl-dir=PATH     Specify path to OpenSSL installation
#   --without-openssl-header-check Disable OpenSSL version consistency check
#   --with-ssl-engine       Enable OpenSSL (hardware) ENGINE support
#   --with-prngd-port=PORT  read entropy from PRNGD/EGD TCP localhost:PORT
#   --with-prngd-socket=FILE read entropy from PRNGD/EGD socket FILE (default=/var/run/egd-pool)
#   --with-pam              Enable PAM support
#   --with-privsep-user=user Specify non-privileged user for privilege separation
#   --with-sandbox=style    Specify privilege separation sandbox (no, capsicum, darwin, rlimit, seccomp_filter, systrace, pledge)
#   --with-selinux          Enable SELinux support
#   --with-kerberos5=PATH   Enable Kerberos 5 support
#   --with-privsep-path=xxx Path for privilege separation chroot (default=/var/empty)
#   --with-xauth=PATH       Specify path to xauth program
#   --with-maildir=/path/to/mail    Specify your system mail directory
#   --with-mantype=man|cat|doc  Set man page type
#   --with-md5-passwords    Enable use of MD5 passwords
#   --without-shadow        Disable shadow password support
#   --with-ipaddr-display   Use ip address instead of hostname in $DISPLAY
#   --with-default-path=    Specify default $PATH environment for server
#   --with-superuser-path=  Specify different path for super-user
#   --with-4in6             Check for and convert IPv4 in IPv6 mapped addresses
#   --with-bsd-auth         Enable BSD auth support
#   --with-pid-dir=PATH     Specify location of ssh.pid file
#   --with-lastlog=FILE|DIR specify lastlog location common locations
