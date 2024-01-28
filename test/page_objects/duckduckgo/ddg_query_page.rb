# frozen_string_literal: true

require_relative '../base_page'
require_relative '../query_page'

class DdgQueryPage < BasePage
  include QueryPage

  URL = "https://duckduckgo.com/"
  QUERY_BOX_CSS = "input[name=q]"

  def search(query)
    super(@driver, QUERY_BOX_CSS, query)
  end

  def open_page
    super(URL)
  end

end
