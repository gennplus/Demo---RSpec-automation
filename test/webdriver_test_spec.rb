# frozen_string_literal: true

require 'rspec'
require 'selenium-webdriver'
require 'yaml'
require_relative './page_objects/duckduckgo/ddg_query_page'
require_relative './page_objects/duckduckgo/ddg_result_page'
require_relative './page_objects/google/google_query_page'
require_relative './page_objects/google/google_result_page'
require_relative './assertions/search_result_assertions'
require_relative './utils/string_utils'

config = YAML.load(File.read("test/config/test_params.yml"), symbolize_names: true)

MT_OPEN_BROWSER_STEP = "\n* Open #{:browser.to_s} browser."
MT_SAVE_RESULT_STEP = "\n* Save 10 first results (copy paste them to notepad or leave resulting page opened)."
MT_CHECK_ATTRIBUTES_STEP = "\n* Check which results items and their attributes contain <keyword> and which don't."
MT_CHECK_OUTPUT_COMPLETENESS_STEP = "* Check if at least one attribute contains all words from query for each result."
MT_COMPARE_RESULTS_STEP = "\n* Compare results for both engines and list out the items which were found in both search engines)"

RSpec.describe 'WebdriverTest' do
  before(:each) do
    browser = config[:browser].to_sym || :chrome
    @driver = Selenium::WebDriver.for(browser)
    @driver.manage.delete_all_cookies
  end

  it 'should search and compare results' do
    query = config[:query] || "something"

    puts MT_OPEN_BROWSER_STEP
    DdgQueryPage.new(@driver)
      .open_page
      .search(query)

    puts MT_SAVE_RESULT_STEP
    ddg_results = DdgResultPage.new(@driver)
      .get_first_ten_results

    puts MT_CHECK_ATTRIBUTES_STEP
    puts MT_CHECK_OUTPUT_COMPLETENESS_STEP
    StringUtils.print_search_engine_section(@driver.title) {
      ddg_results.each { |search_result| SearchResultAssertions
        .assert_has_keywords(search_result, StringUtils.split_into_words(query)) }
    }

    puts MT_OPEN_BROWSER_STEP + " again or a new tab."
    GoogleQueryPage.new(@driver)
      .open_page
      .search(query)

    puts MT_SAVE_RESULT_STEP
    google_results = GoogleResultPage.new(@driver)
      .get_first_ten_results

    puts MT_CHECK_ATTRIBUTES_STEP
    puts MT_CHECK_OUTPUT_COMPLETENESS_STEP
    StringUtils.print_search_engine_section(@driver.title) {
      google_results.each { |search_result| SearchResultAssertions
        .assert_has_keywords(search_result, StringUtils.split_into_words(query)) }
    }

    puts MT_COMPARE_RESULTS_STEP
    popular_results = ddg_results & google_results
    StringUtils.print_common_results_section {
      StringUtils.print_titles(popular_results)
    }
  end

  after(:each) do
    @driver.quit
  end
end
