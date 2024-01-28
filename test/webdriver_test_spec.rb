# frozen_string_literal: true

require 'rspec'
require 'selenium-webdriver'
require_relative './page_objects/duckduckgo/ddg_query_page'
require_relative './page_objects/duckduckgo/ddg_result_page'

RSpec.describe 'WebdriverTest' do
  before(:each) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.manage.delete_all_cookies
  end

  it 'should open browser and navigate to google.com and search for something' do

    DdgQueryPage.new(@driver)
      .open_page
      .search("ruby rspec selenium")

    results = DdgResultPage.new(@driver)
      .get_first_ten_results


    # Temporary code
    sleep 5

    puts "Browser window name is ""#{@driver.title}"""
  end

  after(:each) do
    @driver.quit
  end
end
