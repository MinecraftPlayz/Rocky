#!/bin/sh

PHP_BINARY="php7.0"

while getopts "p:" OPTION 2> /dev/null; do
	case ${OPTION} in
		p)
			PHP_BINARY="$OPTARG"
			;;
	esac
done

./ci/lint.sh -p "$PHP_BINARY"

if [ $? -ne 0 ]; then
	echo Lint scan failed!
	exit 1
fi

echo -e "version\nmakeserver\nstop\n" | "$PHP_BINARY" -dphar.readonly=0 src/pocketmine/PocketMine.php --no-wizard --disable-ansi --disable-readline --debug.level=2
if ls plugins/Rocky/Rocky_1.0dev.phar >/dev/null 2>&1; then
    echo Server phar created successfully.
else
    echo No phar created!
    exit 1
fi
