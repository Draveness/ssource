module Ssource
  module Source
    class Variable < Element
      attr_reader :typename
      def initialize(json)
        super
        @typename = json['typename']
      end

      def to_hash
        "#{name}: #{typename}"
      end

      def pretty_print
        to_hash
      end
    end
  end
end
