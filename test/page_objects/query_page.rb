# frozen_string_literal: true

module QueryPage

  # @abstract method works with abstract query page, type query in edit box and submit it.
  # @param [WebDriver] driver - initialized Selenium WebDriver
  # @param [String] query_box_css - css of element where I should type query
  # @param [String] query - search query
  # @return itself for chain invocation sake
  def search(driver, query_box_css, query)
    puts "  * Type and submit search query \"#{query}\""
    query_box = driver.find_element(css: query_box_css)
    query_box.send_keys(query)
    query_box.submit
    self
  end
end
