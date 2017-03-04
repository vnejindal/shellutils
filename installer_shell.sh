# !/bin/bash
#
#
#  Basic installer script 
#
#
#
#


set -x
usage()
{
    echo "Usage: $0 [params] install|uninstall|start|stop"
    echo "params can be one of following:"
    echo "    --version | -v     : Print out Software version and exit"
    echo "    --help | -h        : Print out this help message"
    echo "    --dry-run| -d      : Dry run the utility without actually changing anything"
    exit 1
}

if test $# -lt 1; then
	usage
fi

DRYRUN=0

while true
do
    case "$1" in
    --version | -v)
	echo "vne::tbd"
	exit 0
	;;
    -h | --help)
	usage
	;;
    -d | --dry-run)
	DRYRUN=1
        shift
	;;
    -*)
	echo Unsupported Option: "$1"
	usage
	;;
    *)
	break
	;;
    esac
done

install()
{
    echo "Installing..."

}
uninstall()
{
    echo "Uninstalling..."

}
COMMAND=$1
echo "Command is $COMMAND"


case $COMMAND in 
install)
install
;;
uninstall)
uninstall
;;
none)
;;
esac
