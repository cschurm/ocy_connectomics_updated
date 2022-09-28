#!/bin/bash -e

BOOST_INC=$(nix-build "<nixpkgs>" --no-build-output -A boost168.dev)/include
# BOOST_LIB=$(nix-build "<nixpkgs>" --no-build-output -A boost168.out)/lib

YASMIC_DIR=.
INC_DIR=include

source ccfiles.sh
OFILES=`echo ${CCFILES} | sed -e 's/\.cc/\.o/g'`

CFLAGS="-O2 -arch x86_64 -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_INC} -I${YASMIC_DIR} -I${INC_DIR}"


#CFLAGS="-g -W -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_DIR} -I${YASMIC_DIR}"

function echocmd {
  echo $@
  $@
}

for file in ${CCFILES}; do
  echocmd g++ $CFLAGS $file

  retVal=$?
  if [ $retVal -ne 0 ]; then
      echo "Error"
      exit $retVal
  fi

done

echocmd ar rc libmbgl-macosx-intel-64-large.a ${OFILES}

echocmd rm ${OFILES}
