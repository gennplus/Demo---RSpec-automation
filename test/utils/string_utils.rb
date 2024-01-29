# frozen_string_literal: true
require_relative '../model/search_result'
class StringUtils
  def self.split_into_words(string)
    return string.scan(/\b\w+\b/)
  end

  def self.print_search_engine_section(search_engine)
    puts ""
    puts ""
    puts "**************************************************"
    puts "*** #{search_engine}"
    puts "**************************************************"
    yield
    puts "**************************************************"
    puts ""
  end

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

  def self.print_titles(search_results)
    puts search_results.map(&:title)
  end
end
