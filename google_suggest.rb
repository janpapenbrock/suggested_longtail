# Encoding: UTF-8

require 'open-uri'
require 'json'

class GoogleSuggest

	MAXIMUM_NUMBER_OF_SUGGESTIONS = 14

	attr_accessor :result

	def self.suggest phrase, language_code, depth = 999
		i = self.new
		i.search(phrase, language_code, depth)
	end

	def self.create_suggest_permutations phrase
		("a".."z").collect{|letter| "#{phrase} #{letter}"}
	end

	def self.create_permutation_parts suggestion, phrase
		parts = suggestion.split " "
		joined_parts = []
		permutations = []
		parts.each do |part|
			joined_parts << part
			permutation = joined_parts.join(" ")
			permutations << permutation if permutation > phrase
		end
		permutations
	end

	def initialize
		self.result = { results: [], stats: { requests: 0, average_results: 0, total_results: 0 } }
		@found = []
	end

	def search phrase, language_code, depth
		return unless depth > 0

		uri_phrase = URI.escape(phrase, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
		url = "http://google.com/complete/search?client=chrome&q=#{uri_phrase}&hl=#{language_code}"

		suggest_contents = {}
		sleep 0.15
		open(url) do |f|
			contents = f.read
			suggest_contents = JSON.parse contents
		end
		suggestions = suggest_contents[1].flatten
		
		need_full_permutations = (suggestions.count == self.class::MAXIMUM_NUMBER_OF_SUGGESTIONS)

		new_suggestions = suggestions - @found
		if new_suggestions
			@found += new_suggestions

			additional_suggestions = generate_additional_suggestions(suggestions, phrase, need_full_permutations)
		
			additional_suggestions.each do |new_suggestion|
				search new_suggestion, language_code, depth - 1
			end
		end

		self.result[:results] = @found
		self.result
	end

	def generate_additional_suggestions suggestions, phrase, need_full_permutations=false
		return [] unless suggestions
		
		alphabet_permutations = self.class.create_suggest_permutations(phrase)
		part_permutations 	  = suggestions.collect{|suggestion| self.class.create_permutation_parts(suggestion, phrase)}
		
		suggestions += part_permutations
		suggestions += alphabet_permutations if need_full_permutations

		suggestions.flatten!

		return [] unless suggestions
		suggestions.uniq!
		return [] unless suggestions

		suggestions -= @found

		suggestions
	end

end