class GoogleSuggest

	attr_accessor :result

	def self.suggest phrase, language_code, depth = 999
		i = self.new
		i.search(phrase, language_code, depth)
	end

	def initialize
		self.result = { results: [], stats: { requests: 0, average_results: 0, total_results: 0 } }
	end

	def search phrase, language_code, depth
		self.result
	end

end