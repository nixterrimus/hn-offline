#!/usr/bin/env bash

DESINATION_PATH="$HOME/Documents/Saved Pages"
PATH="/usr/local/bin:/usr/bin:$PATH"
TEMP_PATH="$HOME/.tmp-httrack"
TARGET_FILENAME="$(date +%Y-%m-%d)-hackernews.mht"

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
	rm -rf $TEMP_PATH
	mkdir -p $TEMP_PATH
	mkdir -p $DESINATION_PATH
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
	mv index.mht "$DESINATION_PATH/$TARGET_FILENAME"
	rm -rf $TEMP_PATH
}

main

