# frozen_string_literal: true

require 'rspec'
require 'selenium-webdriver'
require 'yaml'
require_relative './page_objects/duckduckgo/ddg_query_page'
require_relative './page_objects/duckduckgo/ddg_result_page'

config = YAML.load(File.read("test/config/test_params.yml"), symbolize_names: true)

RSpec.describe 'WebdriverTest' do
  before(:each) do
    browser = config[:browser].to_sym || :chrome
    @driver = Selenium::WebDriver.for(browser)
    @driver.manage.delete_all_cookies
  end

  it 'should open browser and navigate to google.com and search for something' do
    query = config[:query] || "something"

    DdgQueryPage.new(@driver)
      .open_page
      .search(query)

    results = DdgResultPage.new(@driver)
      .get_first_ten_results


    # Temporary code
    sleep 2

    puts "Browser window name is ""#{@driver.title}"""
  end

  after(:each) do
    @driver.quit
  end
end
