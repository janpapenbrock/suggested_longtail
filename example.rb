require "./google_suggest.rb"

suggest_result = GoogleSuggest::suggest("example phrase", "de", 5)

suggest_result[:results].each{|phrase| puts phrase}