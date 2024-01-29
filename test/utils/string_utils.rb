# frozen_string_literal: true

class StringUtils
  def self.split_into_words(string)
    return string.scan(/\b\w+\b/)
  end
end
