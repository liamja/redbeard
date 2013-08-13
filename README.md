Redbeard
========

A [BitTorrent tracker][tracker] ruby gem.

[![Build Status](https://travis-ci.org/liamja/redbeard.png?branch=master)](https://travis-ci.org/liamja/redbeard)
[![Gem Version](https://badge.fury.io/rb/redbeard.png)](http://badge.fury.io/rb/redbeard)

What is Redbeard?
-----------------

Redbeard tracker is designed to be [free][free], secure, easy to install,
modify, configure and deploy. It can be used standalone or included in
your own codebase for use as part of a rails app, indexing site, etc.

When used standalone, Redbeard uses [Sinatra][sinatra] to handle HTTP.

All releases are signed with my [PGP key.][pgpkey]


Installation
------------

    gem install redbeard --no-ri --no-rdoc


Usage
-----

To start the tracker, run:

    redbeard

This starts the tracker with default settings:

* Listens on port 80.
* Logging disabled.
* Error dumps disabled.


Updates
-------

    gem update redbeard --no-ri --no-rdoc


Uninstallation
--------------

    gem uninstall redbeard


License
-------

This code is released under an MIT License.
See [LICENSE.md][license] for the full license text.


[tracker]:  https://en.wikipedia.org/wiki/BitTorrent_tracker "BitTorrent Trackers on Wikipedia"
[free]:     https://en.wikipedia.org/wiki/Free_software "Free Software on Wikipedia"
[sinatra]:  http://www.sinatrarb.com/ "Sinatra"
[mit]:      https://en.wikipedia.org/wiki/MIT_License "MIT License on Wikipedia"
[license]:  /LICENSE.md/ "MIT License"
[pgpkey]:   http://pgp.mit.edu:11371/pks/lookup?op=vindex&search=0x889ECB40163CB640
