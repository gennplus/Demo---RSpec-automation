# frozen_string_literal: true
require_relative '../model/search_result'
class StringUtils

  # @abstract method split string into words clean from punctuation characters, keeps numbers.
  # @example "abc, def. 123" -> ["abc", "def", 123]
  # @param [String] string - string to process
  # @return [Array of Strings]
  def self.split_into_words(string)
    return string.scan(/\b\w+\b/)
  end

  # @abstract method prints to console attributes and their matches
  # @param [Hash<[Array<String>=[field, value]], [Array<String>]>] attributes_with_matches -
  #        a hash with array of strings as key and value
  # @return nothing, only puts
  def self.print_attributes_and_match_words(attributes_with_matches)
    attributes_with_matches.each do |attribute, matches|
      puts "#{attribute[0]} = \"#{attribute[1]}\" has: #{matches.inspect}"
    end
  end

  # @abstract method prints to console attributes
  # @param [SearchResult] search_result - populated search result object
  # @return nothing, only puts
  def self.print_attributes(search_result)
    search_result.to_hash.each do |attribute, value|
      puts "#{attribute} = \"#{value}\""
    end
  end

  # @abstract decorator for attributes
  # @param [SearchResult] result - populated search result object
  # @return nothing, only puts
  def self.print_search_result_section(result)
      puts ""
      puts "-----------------------------------------------"
      puts "#{result.title}"
      puts "------------------ Attributes -----------------"
      yield
      puts "-----------------------------------------------"
  end

  # @abstract method prints to console summary for one search result
  # @param [String] result_title - title of search result
  # @param [Array<String>] keywords - query spited by words
  # @param [Boolean] has_all_keywords - true if all words from query are in result
  # @return nothing, only puts
  def self.print_search_result_summary(result_title, keywords, has_all_keywords)
    if has_all_keywords
      puts "Result \"#{result_title}\" has all keywords (#{keywords.inspect}) from query"
    else
      puts "Result \"#{result_title}\" none of the attributes has all keywords (#{keywords.inspect}) from query"
    end
  end

  # @abstract decorator for search engine, prints a frame
  # @param [String] search_engine - search engine page name
  # @return nothing, only puts
  def self.print_search_engine_section(search_engine)
    puts ""
    puts "**************************************************"
    puts "*** #{search_engine}"
    puts "**************************************************"
    yield
    puts "**************************************************"
    puts ""
  end

  # @abstract decorator for common results, prints a frame
  # @return nothing, only puts
  def self.print_common_results_section
    puts ""
    puts ""
    puts "**************************************************"
    puts "*** Resulting pages from both search engines"
    puts "**************************************************"
    yield
    puts "**************************************************"
    puts ""
  end

  # @abstract method prints title of search results
  # @param [Array<SearchResult>] search_results - populated search result object
  # @return nothing, only puts
  def self.print_titles(search_results)
    puts search_results.map(&:title)
  end
end
