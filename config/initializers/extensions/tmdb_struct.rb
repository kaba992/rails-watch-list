require "tmdb/struct"

module Tmdb
  class Struct
    def initialize(data = nil)
      @table = {}

      data&.each do |k, v|
        set_ostruct_member_value! k, analyze_value(v)
      end
    end
  end
end
