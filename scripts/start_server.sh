#!/bin/bash
service nginx start
swift build --configuration release -Xcc -fblocks -Xlinker -rpath -Xlinker .build/release
/var/www/html/MokuMokuCloud/.build/release/MokuMokuCloud
