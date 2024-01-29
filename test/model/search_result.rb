# frozen_string_literal: true

class SearchResult
  attr_accessor :url, :title, :description

  def initialize(url, title, description)
    @url = url
    @title = title
    @description = description
  end

  def ==(other)
    title == other.title
  end

  def <=>(other)
    title <=> other.title
  end

  def hash
    [title].hash
  end

  def eql?(other)
    self == other
  end
end
