# HN Offline

![ScreenShot](https://raw.github.com/nixterrimus/hn-offline/master/screenshot.png)

This script creates an offline version of the Hacker News homepage with
working offline links for the articles and comments.  It's useful for
reading while offline or having a record of what's on the homepage day
by day.


## Motivation

HN was created to be able to read Hacker News on an airplane.  Right
before I get on a plane I'm always scrambling to open a bunch of new
tabs so that I have things to read.  This solves that by creating one,
neat, file that contains all of the days news and comments.

## Reading the MHT file

This script produces an [MHT file](https://en.wikipedia.org/wiki/MHTML)
at the end of its run.  To view this you'll need a browser that can view
this kind of file, I like
[Firefox](https://www.mozilla.org/en-US/firefox/new/) with the [unMH
extension](https://addons.mozilla.org/en-us/firefox/addon/unmht/).  The
one complaint I have with this setup is it takes about 45 seconds for
the browser to parse the MHT file when I load it.


## Installation of the script

This bash script is pretty easy to install, just download the git
repository to your favorite script location, `chmod a+x hn-offline.sh`
and then run it.


## Installation of HTTrack

HN offline depends on a mirroring program called
[HTTrack](http://www.httrack.com/).  You will need to install it and
have it in your path to be able to run hn-offline.

On a mac, with homebrew:
  
  brew install httrack

On Ubuntu:

  apt-get install webhttrack


For other distributions, see the [HTTrack installation
page](http://www.httrack.com/page/2/)

## Author

hn offline was written by [Nick Rowe](http://dcxn.com) in the Spring of
2013.
