# frozen_string_literal: true

class BasePage
  def initialize(driver)
    @driver = driver
  end

  # @abstract base method opens web page in the browser,
  # @param [String] url - web page URL
  # @return itself for chain invocation sake
  def open_page(url)
    puts "  * Open #{url} page"
    @driver.navigate.to url
    self
  end
end
