require 'test/unit'

require_relative '../test_helper.rb'
require_relative '../../lib/google_suggest.rb'

class GoogleSuggestTest < Test::Unit::TestCase
  def test_create_suggest_permutations
    permutations = GoogleSuggest.create_suggest_permutations "foo"

    assert_equal "foo a", permutations.first
    assert_equal "foo z", permutations.last

    assert_equal 26, permutations.count
  end

  def test_create_permutation_parts
  	permutations = GoogleSuggest.create_permutation_parts "foo bar baz", "foo"

  	assert_equal "foo bar", permutations.first
  	assert_equal "foo bar baz", permutations.last
	assert_equal 2, permutations.count
  end

  def test_create_permutation_parts_empty
  	permutations = GoogleSuggest.create_permutation_parts "foo", "foo bar"
  	
	assert_equal 0, permutations.count
  end

  def test_generate_additional_suggestions
  	suggest = GoogleSuggest.new
  	permutations = suggest.generate_additional_suggestions [ "foo bar", "foo baz", "foo bar baz" ], "foo"

  	assert_equal "foo bar", permutations.first
  	assert_equal "foo bar baz", permutations.last
	assert_equal 3, permutations.count
  end

  def test_generate_additional_suggestions_full
  	suggest = GoogleSuggest.new
  	permutations = suggest.generate_additional_suggestions [ "foo bar", "foo baz", "foo bar baz" ], "foo", true

  	assert_equal "foo bar", permutations.first
  	assert_equal "foo z", permutations.last
	assert_equal 29, permutations.count
  end

  def test_generate_additional_suggestions_none
  	suggest = GoogleSuggest.new
  	assert_equal [], suggest.generate_additional_suggestions(nil, nil)
  end
end