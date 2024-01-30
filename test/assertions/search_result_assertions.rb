# frozen_string_literal: true

require_relative '../model/search_result'
class SearchResultAssertions
  def self.get_attributes_and_their_keywords(search_result, keywords)
    assertion_result = {}
    search_result.to_hash.each {
      |attr| assertion_result.merge!(keywords_in_attribute(keywords, attr))
    }
    return assertion_result
  end

  def self.assert_at_least_one_attribute_has_all_keywords(search_result, keywords)
    result = false
    search_result.to_hash.each {
      |attr| result = result || is_all_keywords_in_attribute(keywords, attr[1].to_s)
    }
    return result
  end

  private
  def self.keywords_in_attribute(keywords, attribute)
    lowercase_attribute_value = attribute[1].to_s.downcase
    lowercase_keywords = keywords.map(&:downcase)

    presented_keywords = []
    lowercase_keywords.each do |keyword|
      if lowercase_attribute_value.include?(keyword)
        presented_keywords << keyword
      end
    end
    return {[attribute[0], attribute[1].to_s] => presented_keywords}
  end

  def self.is_all_keywords_in_attribute(keywords, attribute_value)
    lowercase_attribute_value = attribute_value.downcase
    lowercase_keywords = keywords.map(&:downcase)
    return lowercase_keywords.all? {
      |keyword| lowercase_attribute_value.include?(keyword)
    }
  end
end
