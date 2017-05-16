require_relative 'klass'

module Ssource
  module Source
    class Extension < Klass
      def initialize(json)
        super
        if superklass
          @protocols << superklass
          @superklass = nil
        end
      end
    end
  end
end
