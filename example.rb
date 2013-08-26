# Encoding: UTF-8

require "./google_suggest.rb"

suggest_result = GoogleSuggest::suggest("bacon", "en", 2)

suggest_result[:results].each{|phrase| puts phrase}