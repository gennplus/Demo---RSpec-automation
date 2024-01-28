# frozen_string_literal: true

require_relative '../model/search_result'

module ResultPage
  def get_first_ten_results(driver, css_map)
    wait = Selenium::WebDriver::Wait.new
    wait.until { driver.find_element(css: css_map[:footer]).displayed? }

    result_elements = driver.find_elements(css: css_map[:block])

    results = []
    result_elements.each_with_index { |res, index| results << SearchResult.new(
      # res.find_element(css:... throws Stale Element Exception
      # So I use driver directly with specific locators
      driver.find_element(css: css_map[:url] % [index + 1]).attribute("href"),
      driver.find_element(css: css_map[:title] % [index + 1]).text,
      driver.find_element(css: css_map[:description] % [index + 1]).text)
    }

    results
  end
end
