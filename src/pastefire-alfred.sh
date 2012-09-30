#!/bin/sh
#
# Configuring:
#
#   defaults write org.curioussquid.pastefire email YOUR@EMAIL
#   defaults write org.curioussquid.pastefire password YOURPASS
#
#
function urlencode() {
  if [ $# -eq 0 ]; then
    ruby -rcgi -e 'puts(CGI.escape STDIN.read.strip)'
  else
    echo "$*" | ruby -rcgi -e 'puts(CGI.escape STDIN.read.strip)'
  fi
}
email=`defaults read org.curioussquid.pastefire email | urlencode`
password=`defaults read org.curioussquid.pastefire password | urlencode`
if [ -z "$email" -o -z "$password" ]; then
  echo "You must configure email and password first."
  exit 1
fi
STR="{query}"
if [ -z "$STR" ]; then
  STR=$(pbpaste | urlencode)
  SUCCESSMSG="Clipboard sent to Pastefire."
else
  STR=$(urlencode $STR)
  SUCCESSMSG="Argument sent to Pastefire."
fi
res=`curl "https://pastefire.com/set_bookmarklet.php?email=$email&pwd=$password&clipboard=$STR"`
if [ $? -ne 0 ]; then
  echo "Pastefire failed"
else
  echo "$SUCCESSMSG"
fi

