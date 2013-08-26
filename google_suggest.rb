require 'open-uri'
require 'json'

class GoogleSuggest

	attr_accessor :result

	def self.suggest phrase, language_code, depth = 999
		i = self.new
		i.search(phrase, language_code, depth)
	end

	def initialize
		self.result = { results: [], stats: { requests: 0, average_results: 0, total_results: 0 } }
		@found = []
	end

	def search phrase, language_code, depth
		return unless depth > 0

		uri_phrase = URI.escape(phrase, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
		url = "http://google.com/complete/search?client=chrome&q=#{uri_phrase}&hl=#{language_code}"

		p url

		suggest_contents = {}
		open(url) do |f|
			suggest_contents = JSON.parse f.read
		end
		suggestions = suggest_contents[1]

		new_suggestions = suggestions - @found
		@found += new_suggestions

		new_suggestions.each do |new_suggestion|
			search new_suggestion, language_code, depth - 1
		end

		self.result[:results] = @found
		self.result
	end

end