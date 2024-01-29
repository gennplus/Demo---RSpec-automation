# frozen_string_literal: true

require_relative '../model/search_result'
class SearchResultAssertions
  def self.assert_has_keywords(search_result, keywords)
    puts ""
    puts "-----------------------------------------------"
    puts "#{search_result.title}"
    puts "------------------ Attributes -----------------"
    print_keywords_presence_in_attribute(keywords, "URL", search_result.url)
    print_keywords_presence_in_attribute(keywords, "Title", search_result.title)
    print_keywords_presence_in_attribute(keywords, "Description", search_result.description)
    puts "-----------------------------------------------"

    if is_all_keywords_in_attribute(keywords, search_result.url) ||
       is_all_keywords_in_attribute(keywords, search_result.title) ||
       is_all_keywords_in_attribute(keywords, search_result.description)
      puts "Result ""#{search_result.title}"" has all keywords (#{keywords.inspect}) from query"
      return true
    end

    puts "Result ""#{search_result.title}"" none of the attributes has all keywords (#{keywords.inspect}) from query"
    return false
  end

  private
  def self.print_keywords_presence_in_attribute(keywords, attribute_name, attribute_value)
    lowercase_attribute_value = attribute_value.downcase
    lowercase_keywords = keywords.map(&:downcase)
    print "  #{attribute_name} has: "
    lowercase_keywords.each do |keyword|
      if lowercase_attribute_value.include?(keyword)
        print keyword + " "
      end
    end
    print "\n"
  end

  def self.is_all_keywords_in_attribute(keywords, attribute_value)
    lowercase_attribute_value = attribute_value.downcase
    lowercase_keywords = keywords.map(&:downcase)
    return lowercase_keywords.all? {
      |keyword| lowercase_attribute_value.include?(keyword)
    }
  end
end
