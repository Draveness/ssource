require 'json'
require_relative 'source/element'
require_relative 'source/klass'
require_relative 'source/method'
require_relative 'source/variable'
require_relative 'source/factory'

module Ssource
  module Source
    def self.from(file)
      json = Ssource::SourceKitten.structure file
      json['key.substructure'].reduce([]) do |result, structure|
        result << Factory.build(structure)
      end
    end
  end
end
