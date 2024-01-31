# frozen_string_literal: true

require_relative '../base_page'
require_relative '../query_page'

class DdgQueryPage < BasePage
  include QueryPage

  URL = "https://duckduckgo.com/"
  QUERY_BOX_CSS = "input[name=q]"

  # @abstract method works with duckduckgo main page, type query in edit box and submit it.
  # @param [String] query - search query
  # @return nothing, but SUPER() returns itself for chain invocation sake
  def search(query)
    super(@driver, QUERY_BOX_CSS, query)
  end

  # @abstract method opens main duckduckgo page in the browser,
  # @return nothing, but SUPER() returns itself for chain invocation sake
  def open_page
    super(URL)
  end

end
