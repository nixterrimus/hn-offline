#!/usr/bin/env bash

DESTINATION_PATH=$(pwd)
TEMP_PATH=$(mktemp -dt "$0")
TARGET_FILENAME="$(date +%Y-%m-%d)-hackernews.mht"

usage="$(basename "$0") [-h] [-o destination] builds an offline edition of Hacker News saved as an MHT file

where:
-o  output directory location
-h  show this help text"

while [ $# -gt 0 ]
do
    case $1 in
    -h|--help) 
      echo "$usage"
      exit 0;;
    -o|--output)
      DESTINATION_PATH="$2"
      shift;;
    (--) shift; break;;
    (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    (*) break;;
    esac
    shift
done

function main(){
	checkDependencies
	setupEnvironment
	downloadHN
	cleanUp
}

function checkDependencies(){
	command -v httrack >/dev/null 2>&1 || { echo >&2 "hn-offline requires httrack with SSL support\nPlease install httrack. See github.com/nixterrimus/hn-offline for help."; exit 1; }
}

function setupEnvironment(){
	mkdir -p $DESTINATION_PATH
	cd $TEMP_PATH
}

function downloadHN() {
	# -%M - mirror to mht file
	# -r2 - Mirror to depth 2 on news.ycombinator.com, this saves comment pages
	# -%e1 - Mirror 1 level offsite, this saves articles
	# --near - Saves stylesheets, JS, and images that pages depend on
	# --quiet - when there is nothing to say, say nothing
	# links that start with -  - Do not mirror these files
	httrack -%M -r2 -%e1 --near --quiet https://news.ycombinator.com/ "-*news.ycombinator.com/user*" "-*news.ycombinator.com/newest" "-*news.ycombinator.com/newcomments" "-*news.ycombinator.com/ask" "-*news.ycombinator.com/jobs" "-*news.ycombinator.com/submit" "-*news.ycombinator.com/newslogin*" "-*news.ycombinator.com/news2" "-*news.ycombinator.com/lists" "-*news.ycombinator.com/rss" "-*ycombinator.com/bookmarklet.html" "-*ycombinator.com/newsguidelines.html" "-*ycombinator.com/newsfaq.html" "-*news.ycombinator.com/dmca.html" "-*ycombinator.com/newsnews.html" "-*news.ycombinator.com/item?id=363" "-http://ycombinator.com/" "-*ycombinator.com/apply.html" "-*ycombinator.com/lib.html"
}

function cleanUp(){
	mv index.mht "$DESTINATION_PATH/$TARGET_FILENAME"
	rm -rf $TEMP_PATH
}

main

