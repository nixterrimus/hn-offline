# HN Offline

![ScreenShot](https://raw.github.com/nixterrimus/hn-offline/master/screenshot.png)

This script creates an offline version of the Hacker News homepage with
working offline links for the articles and comments.  It's useful for
reading while offline or having a record of what's on the homepage day
by day.

## Installation

If you're using a mac and homebrew, installation is very easy:

- `brew tap nixterrimus/hnoffline`
- `brew install hn-offline`

After you've installed, the script can run as `hn-offline`.  This will output an MHT file to `$HOME/Documents/Saved Pages`.

If you're on another kind of system, this bash script is stil pretty easy to install.  First make sure you have **httrack** installed and in your path.  Then download the git repository to your favorite script location, `chmod a+x hn-offline.sh` and then run it.  


## Reading the MHT file

This script produces an [MHT file](https://en.wikipedia.org/wiki/MHTML)
at the end of its run.  To view this you'll need a browser that can view
this kind of file, I like
[Firefox](https://www.mozilla.org/en-US/firefox/new/) with the [unMH
extension](https://addons.mozilla.org/en-us/firefox/addon/unmht/).  The
one complaint I have with this setup is it takes about 45 seconds for
the browser to parse the MHT file when I load it.


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


## Motivation

HN Offline was created to be able to read Hacker News on an airplane.
Right before I get on a plane I'm always scrambling to open a bunch of
new tabs so that I have things to read.  This solves that by creating
one, neat, file that contains all of the days news and comments.


## Author

hn offline was written by [Nick Rowe](http://dcxn.com) in the Spring of
2013.
