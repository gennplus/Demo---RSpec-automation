# frozen_string_literal: true
require_relative '../base_page'
require_relative '../result_page'

class DdgResultPage < BasePage
  include ResultPage

  RESULT_DETAILS_CSS = {
    block: "article",
    url: "li:nth-of-type(%d) article a[data-testid=result-extras-url-link]",
    title: "li:nth-of-type(%d) article h2",
    description: "li:nth-of-type(%d) article div[data-result=snippet]",
    footer: "#more-results"
  }

  def get_first_ten_results
    super(@driver, RESULT_DETAILS_CSS)
  end

end