suggested_longtail
==================

[![Code Climate](https://codeclimate.com/github/janpapenbrock/suggested_longtail.png)](https://codeclimate.com/github/janpapenbrock/suggested_longtail)

A ruby tool for fetching Google autocomplete suggestions.

Usage
-----

```
require "./google_suggest.rb"

suggest_result = GoogleSuggest::suggest("example phrase", "de", 5)

suggest_result[:results].each{|phrase| puts phrase}
```
