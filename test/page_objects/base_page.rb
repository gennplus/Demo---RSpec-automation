# frozen_string_literal: true

class BasePage
  def initialize(driver)
    @driver = driver
  end

  def open_page(locator)
    puts "  * Open #{locator} page"
    @driver.navigate.to locator
    self
  end
end
