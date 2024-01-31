# frozen_string_literal: true

# Model class for storing search result in structured way.
# unique key is title.
# objects comparable and it's doable to apply set operations.
# fields are immutable after initialization
class SearchResult
  attr_reader :url, :title, :description

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

  # returns itself as hash of {"fields", "values"}
  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end

end
