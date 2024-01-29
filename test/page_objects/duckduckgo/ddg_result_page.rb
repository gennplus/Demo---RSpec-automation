# frozen_string_literal: true
require_relative '../base_page'
require_relative '../result_page'

class DdgResultPage < BasePage
  include ResultPage

  RESULT_DETAILS_CSS = {
    block: "article",
    url: "a[data-testid=result-extras-url-link]",
    title: "h2",
    description: "div[data-result=snippet]",
    footer: "#more-results" # plays a role of indicator that search results are on the page
  }

  def get_first_ten_results
    super(@driver, RESULT_DETAILS_CSS)
  end

end