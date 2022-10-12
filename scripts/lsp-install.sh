#!/bin/env bash

#--------------------------------------------------------------------#
#                             How to use                             #
#--------------------------------------------------------------------#

## set the permission to run
# chmod u+x ./lsp-install.sh

## install java-debug
# ./lsp-install.sh install java_debug -v 0.41.0

## install vscode-java-test
# ./lsp-install.sh install java_test -v 0.37.0

JAVA_LSP_ADDITION_DIR="$HOME/.local/share/nvim/lsp_server_additions/jdtls"

sub_help() {
	echo "Usage: $ProgName <subcommand> [options]\n"
	echo "Subcommands:"
	echo "    save"
	echo "    list"
	echo ""
}

get_version() {
	version=''

	while test $# -gt 0; do
		case "$1" in
		-v | --version)
			shift

			if test $# -gt 0; then
				version=$1
				break
			else
				echo "--version has to be passed"
				exit 1
			fi
			;;
		*)
			break
			;;
		esac
	done

	echo $version
}

download_github_release() {
	repository=$1
	file_name=$2
	download_dir="project"

	url_template="https://github.com/microsoft/$repository/archive/refs/tags/$file_name"

	mkdir "$download_dir"
	wget -qO- "$url_template" | tar xvz -C "$download_dir" > /dev/null

	echo "$(pwd)/$download_dir"
}

sub_install_java_debug() {
	version="$(get_version $@)"
	dir="$(mktemp -d)"
	cd "$dir"

	download_dir="$(download_github_release java-debug $version.tar.gz)"

	cd "$download_dir/java-debug-$version"
	chmod u+x ./mvnw
	mvn clean install -Dmaven.artifact.threads=10 > /dev/null

	echo "moving java-debug build files"
	/bin/cp -f com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar "$JAVA_LSP_ADDITION_DIR"
}

sub_install_java_test() {
	version="$(get_version $@)"
	dir="$(mktemp -d)"
	cd "$dir"

	download_dir="$(download_github_release vscode-java-test $version.tar.gz)"

	echo "$download_dir/vscode-java-test-$version" 
	cd "$download_dir/vscode-java-test-$version"

	yarn > /dev/null
	yarn build-plugin > /dev/null

	echo "moving java-test build files"
	/bin/cp -f server/*.jar "$JAVA_LSP_ADDITION_DIR"
}

subcommand=$1

case $subcommand in
"-h" | "--help")
	sub_help
	;;

install)
	shift
	package=$1

	case $package in
	*)
		shift
		sub_install_${package} $@
		if [ $? = 127 ]; then
			echo "Error: '$subcommand' is not a known subcommand." >&2
			echo "       Run '$ProgName --help' for a list of known subcommands." >&2
			exit 1
		fi
		;;
	esac
	if [ $? = 127 ]; then
		echo "Error: '$subcommand' is not a known subcommand." >&2
		echo "       Run '$ProgName --help' for a list of known subcommands." >&2
		exit 1
	fi
	;;
esac
