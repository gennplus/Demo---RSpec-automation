# frozen_string_literal: true

class GoogleQueryPage < BasePage
  include QueryPage

  URL = "https://google.com/"
  QUERY_BOX_CSS = "textarea[name=q]"

  # @abstract method works with google main page, type query in edit box and submit it.
  # @param [String] query - search query
  # @return nothing, but SUPER() returns itself for chain invocation sake
  def search(query)
    super(@driver, QUERY_BOX_CSS, query)
  end

  # @abstract method opens main google page in the browser,
  # Sleeps 5 seconds in order to give you time to click on possible cookie agreement popup.
  # @return itself for chain invocation sake
  def open_page
    super(URL)
    sleep(5)
    self
  end
end
