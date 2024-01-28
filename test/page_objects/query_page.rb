# frozen_string_literal: true

module QueryPage
  def search(driver, query_box_css, query)
    query_box = driver.find_element(css: query_box_css)
    query_box.send_keys(query)
    query_box.submit
    self
  end
end
