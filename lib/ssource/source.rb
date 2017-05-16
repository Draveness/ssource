require_relative 'source/root'

module Ssource
  module Source
    def self.from(file)
      Root.new(file)
    end
  end
end
