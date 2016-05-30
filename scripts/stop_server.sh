#!/bin/bash
isExistNginx=`pgrep nginx`
if [[ -n \$isExistNginx ]]; then
  service nginx stop
fi
isExistApp=`pgrep MokuMokuCloud`
if [[ -n \$isExistApp ]]; then
  pkill MokuMokuCloud
fi
swift build --clean
rm -rf /var/www/html/MokuMokuCloud/Packages
