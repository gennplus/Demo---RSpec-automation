# frozen_string_literal: true

class GoogleQueryPage < BasePage
  include QueryPage

  URL = "https://google.com/"
  QUERY_BOX_CSS = "textarea[name=q]"

  def search(query)
    super(@driver, QUERY_BOX_CSS, query)
  end

  def open_page
    super(URL)
    sleep(5)
    self
  end
end
