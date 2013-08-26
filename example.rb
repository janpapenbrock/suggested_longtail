# Encoding: UTF-8

require "./google_suggest.rb"

suggest_result = GoogleSuggest::suggest("bacon", "en", 2)

results = suggest_result[:results].sort.join("\n")

time = Time.now.to_i
File.open("suggest_results_#{time}.txt", 'w') {|f| f.write(results) }