require 'json'
require_relative 'source/element'
require_relative 'source/klass'
require_relative 'source/method'
require_relative 'source/variable'
require_relative 'source/factory'

module Ssource
  module Source
    def self.from(file)
      elements = Ssource::SourceKitten.structure file
      elements.map { |element| Factory.build element }
    end
  end
end
