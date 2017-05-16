require_relative 'source/root_object'

module Ssource
  module Source
    def self.from(file)
      RootObject.new(file)
    end
  end
end
