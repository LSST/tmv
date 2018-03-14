export SCONSFLAGS=$SCONSFLAGS" USE_UNKNOWN_VARS=true WITH_BLAS=false PREFIX="$PREFIX
install()
{
	default_install
	if [[ $OSTYPE == darwin* ]]; then
		# This is hardcoded in the SConscript file, so hard coding here too.
		# If TMV is upgraded, please update this value as well
		compat_version="0"
		curdir=$(pwd)
		cd $PREFIX/lib
		rm libtmv.dylib
		tmv_name=libtmv.${compat_version}.dylib
		tmv_symband_name=libtmv_symband.${compat_version}.dylib
		ln -s $tmv_name libtmv.dylib
		install_name_tool -id @rpath/$tmv_name $tmv_name
		rm libtmv_symband.dylib
		ln -s $tmv_symband_name libtmv_symband.dylib
		install_name_tool -id @rpath/$tmv_symband_name $tmv_symband_name
		install_name_tool -change $PREFIX/lib/$tmv_name @rpath/$tmv_name $tmv_symband_name
		sed -i -e s@$PREFIX@\$TMV_DIR@g $PREFIX/share/tmv/tmv-link
		cd $curdir
	fi
}
