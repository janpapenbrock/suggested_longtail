suggested_longtail
==================

A ruby tool for fetching Google autocomplete suggestions.

Usage
-----

```
require google_suggest

suggest_result = GoogleSuggest::suggest("example phrase", "de", 5)

suggest_result.results.each{|phrase| puts phrase}
```