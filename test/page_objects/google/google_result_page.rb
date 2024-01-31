# frozen_string_literal: true

class GoogleResultPage < BasePage
  include ResultPage

  RESULT_DETAILS_CSS = {
    block: "div#rso div[data-snc]",
    url: "cite", # relative to block
    title: "h3", # relative to block
    description: "div[data-sncf] span", # relative to block
    footer: "#search"  # plays a role of indicator that search results are on the page
  }

  # @abstract method works with google result page, it grabs first ten results.
  # @return [SearchResult] - populated model object
  def get_first_ten_results
    super(@driver, RESULT_DETAILS_CSS)
  end
end
