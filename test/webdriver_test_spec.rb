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

MT_OPEN_BROWSER_STEP = "\n* Open browser "
MT_SAVE_RESULT_STEP = "\n* Save 10 first results (copy paste them to notepad or leave resulting page opened)."
MT_CHECK_ATTRIBUTES_STEP = "\n* Check which results items and their attributes contain <keyword(s)> and which don't."
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
    keywords = StringUtils.split_into_words(query)

    puts MT_OPEN_BROWSER_STEP + config[:browser].to_s
    DdgQueryPage.new(@driver)
      .open_page
      .search(query)

    puts MT_SAVE_RESULT_STEP
    ddg_results = DdgResultPage.new(@driver)
      .get_first_ten_results

    puts MT_CHECK_ATTRIBUTES_STEP
    puts MT_CHECK_OUTPUT_COMPLETENESS_STEP
    StringUtils.print_search_engine_section(@driver.title) {
      ddg_results.each { |search_result|
        StringUtils.print_search_result_section(search_result) {
          StringUtils.print_attributes_and_match_words(SearchResultAssertions
            .get_attributes_and_their_keywords(search_result, keywords))
        }
        StringUtils.print_search_result_summary(search_result.title, keywords,
          SearchResultAssertions.assert_at_least_one_attribute_has_all_keywords(search_result, keywords))
      }
    }

    puts MT_OPEN_BROWSER_STEP + config[:browser].to_s + " again or open a new tab."
    GoogleQueryPage.new(@driver)
      .open_page
      .search(query)

    puts MT_SAVE_RESULT_STEP
    google_results = GoogleResultPage.new(@driver)
      .get_first_ten_results

    puts MT_CHECK_ATTRIBUTES_STEP
    puts MT_CHECK_OUTPUT_COMPLETENESS_STEP
    StringUtils.print_search_engine_section(@driver.title) {
      google_results.each { |search_result|
        StringUtils.print_search_result_section(search_result) {
          StringUtils.print_attributes_and_match_words(SearchResultAssertions
            .get_attributes_and_their_keywords(search_result, keywords))
        }
        StringUtils.print_search_result_summary(search_result.title, keywords,
          SearchResultAssertions.assert_at_least_one_attribute_has_all_keywords(search_result, keywords))
      }
    }

    puts MT_COMPARE_RESULTS_STEP
    popular_results = ddg_results & google_results
    StringUtils.print_common_results_section {
      popular_results.each { |search_result|
        StringUtils.print_search_result_section(search_result) {
          StringUtils.print_attributes(search_result)
        }
      }
    }
  end

  after(:each) do
    @driver.quit
  end
end
