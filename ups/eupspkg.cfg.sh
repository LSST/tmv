NJOBS=1
export SCONSFLAGS=$SCONSFLAGS" USE_UNKNOWN_VARS=true PREFIX="$PREFIX"/lib"

build()
{
    echo "SFD build"
    echo $PRODUCT_DIR
    echo $LD_LIBRARY_PATH
    echo $PATH
    echo $C_INCLUDE_PATH
    default_build
}
