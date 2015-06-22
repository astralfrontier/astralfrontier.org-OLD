#!/bin/bash

set -ex

npm start
rsync -av --delete build/ astralfrontier@astralfrontier.org:/var/www/astralfrontier.org/public
