#!/bin/bash
echo -e "version\nmakeserver\nstop\n" | php src/pocketmine/PocketMine.php --no-wizard | grep -v "\[Tesseract] Adding "
if ls plugins/Tesseract/Rocky*.phar >/dev/null 2>&1; then
    echo Server packaged successfully.
else
    echo No phar created!
    exit 1
fi
