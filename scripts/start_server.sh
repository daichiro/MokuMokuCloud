#!/bin/bash
service nginx start
swift build --configuration release
/var/www/html/MokuMokuCloud/.build/release/MokuMokuCloud
