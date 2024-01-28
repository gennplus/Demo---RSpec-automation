# frozen_string_literal: true

class SearchResult
  attr_accessor :url, :title, :description

  def initialize(url, title, description)
    @url = url
    @title = title
    @description = description
  end
end
