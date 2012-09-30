# About

This is an Alfred extension for using the Pastefire service to send text to your phone.  It
requires Mac OS X and the Alfred launcher application.  You'll also need to have purchased
the Alfred Powerpack to enable the use of extensions.

You'll need to install both [Alfred](http://www.alfredapp.com) and the (non-free) [Powerpack](http://www.alfredapp.com/powerpack/)
before installing this extension.

# Usage

There are two ways to invoke it.  First, you can just invoke the keyword "pastefire" from
the Alfred prompt and it will send whatever text is currently in your Mac's clipboard.

    pastefire

Alternately, you can provide a string after the "pastefire" command and that will be sent.
e.g.:

    pastefire send this text to my phone

# Installing

You can just download the Pastefire.alfredextension file and double click on it.

You will need to configure your email and password from the command line as shown below
before the extension can function.

# Configuring:

You will need a Pastefire email address and password.  There is no account creation process
as such, but your phone and this extension will need to have the same parameters for the
system to function.

    defaults write org.curioussquid.pastefire email 'YOUR@EMAIL'
    defaults write org.curioussquid.pastefire password 'YOURPASS'

# Creating From Source

If you'd like to create your own Alfred extension, here's how:

1. Create a new "Bash Script" extension

2. Set "Keyword" to "pastefire"

3. Check "Silent"

4. Click under the "Advanced" tab and check these options:
  1. Escaping: Backquotes, Double Quotes, Dollar
  2. Output: Output to Notification Center

5. Paste in the script from the "src" directory in this repository.

