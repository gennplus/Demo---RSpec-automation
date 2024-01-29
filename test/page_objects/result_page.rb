# frozen_string_literal: true

require_relative '../model/search_result'

module ResultPage
  def get_first_ten_results(driver, css_map)
    wait = Selenium::WebDriver::Wait.new
    wait.until { driver.find_element(css: css_map[:footer]).displayed? }

    result_elements = driver.find_elements(css: css_map[:block])

    results = []
    result_elements.each_with_index { |res| results << SearchResult.new(
      get_attribute_or_text(res.find_element(css: css_map[:url]), "href"),
      res.find_element(css: css_map[:title]).text,
      res.find_element(css: css_map[:description]).text)
    }

    results
  end

  private
  def get_attribute_or_text(element, attr)
    attribute_value = element.attribute(attr)
    if attribute_value.nil? || attribute_value.empty?
      return element.text
    end
    return attribute_value
  end
end
