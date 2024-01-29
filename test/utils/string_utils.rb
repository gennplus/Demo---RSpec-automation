# frozen_string_literal: true

class StringUtils
  def self.split_into_words(string)
    return string.scan(/\b\w+\b/)
  end

  def self.print_search_engine_section(search_engine)
    puts ""
    puts ""
    puts "***************************************"
    puts "*** #{search_engine}"
    puts "***************************************"
    yield
    puts "***************************************"
    puts ""
  end
end
