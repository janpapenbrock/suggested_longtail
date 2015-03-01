suggested_longtail
==================

[![Code Climate](https://codeclimate.com/github/janpapenbrock/suggested_longtail.png)](https://codeclimate.com/github/janpapenbrock/suggested_longtail)

A ruby tool for fetching Google autocomplete suggestions.

Basic usage
-----------

Simply pass your base search phrase to `bin/suggest` to receive an alphabetically sorted list of suggestions.

```
~/suggested_longtail $ bin/suggest "hello world"
hello world android
hello world android app
hello world assembly
hello world c program
hello world c++
hello world communications
hello world html
hello world java
hello world java code
hello world java program
hello world javascript
hello world kid ink
hello world lady antebellum
hello world lyrics
hello world php
hello world program
hello world python
hello world ruby
http://www.metrolyrics.com/hello-world-lyrics-lady-antebellum.html
```

Advanced usage
-----------

`bin/suggest` supports takes three parameters:

  1. Required. Search phrase to use as base for suggestions.
  2. Optional. Language code. Examples: en, de. Default: en.
  3. Optional. Search depth. Default: 1.
