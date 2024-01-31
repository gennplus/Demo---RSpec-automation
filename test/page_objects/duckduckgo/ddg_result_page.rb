# frozen_string_literal: true
require_relative '../base_page'
require_relative '../result_page'

class DdgResultPage < BasePage
  include ResultPage

  RESULT_DETAILS_CSS = {
    block: "article",
    url: "a[data-testid=result-extras-url-link]", # relative to block
    title: "h2", # relative to block
    description: "div[data-result=snippet]", # relative to block
    footer: "#more-results" # plays a role of indicator that search results are on the page
  }

  # @abstract method works with duckduckgo result page, it grabs first ten results.
  # @return [SearchResult] - populated model object
  def get_first_ten_results
    super(@driver, RESULT_DETAILS_CSS)
  end

end