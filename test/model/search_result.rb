# frozen_string_literal: true

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

  # return myself as hash of {"fields", "values"}
  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end

end
