# frozen_string_literal: true

require_relative '../model/search_result'
class SearchResultAssertions
  def self.assert_has_keywords(search_result, keywords)
    puts ""
    puts "-----------------------------------------------"
    puts "  #{search_result.title}"
    puts "-----------------------------------------------"
    print_keywords_presence_in_attribute(keywords, "URL", search_result.url)
    print_keywords_presence_in_attribute(keywords, "Title", search_result.title)
    print_keywords_presence_in_attribute(keywords, "Description", search_result.description)
    puts "-----------------------------------------------"

    if is_all_keywords_in_attribute(keywords, search_result.url) ||
       is_all_keywords_in_attribute(keywords, search_result.title) ||
       is_all_keywords_in_attribute(keywords, search_result.description)
      puts "Result #{search_result.title} has all keywords from query"
      return true
    end

    return false
  end

  private
  def self.print_keywords_presence_in_attribute(keywords, attribute_name, attribute_value)
    print "  #{attribute_name} has: "
    keywords.each do |keyword|
      if attribute_value.include?(keyword)
        print keyword + "\n"
      end
    end
  end

  def self.is_all_keywords_in_attribute(keywords, attribute_value)
    # result = false
    # keywords.each do |keyword|
    #   if attribute_value.include?(keyword)
    #     print keyword + "\n"
    #   end
    # end

    return keywords.all? { |keyword| attribute_value.include?(keyword) }
  end

  def self.is_any_keywords_in_attribute(keywords, attribute_value)
    return keywords.any? { |keyword| attribute_value.include?(keyword) }
  end
end
