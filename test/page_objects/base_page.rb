# frozen_string_literal: true

class BasePage
  def initialize(driver)
    @driver = driver
  end

  def open_page(locator)
    @driver.navigate.to locator

  end
end
