# frozen_string_literal: true

class GoogleResultPage < BasePage
  include ResultPage

  RESULT_DETAILS_CSS = {
    block: "div#rso div[data-snc]",
    url: "cite",
    title: "h3",
    description: "div[data-sncf] span",
    footer: "#search"  # plays a role of indicator that search results are on the page
  }

  def get_first_ten_results
    super(@driver, RESULT_DETAILS_CSS)
  end
end
