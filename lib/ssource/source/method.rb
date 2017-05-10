module Ssource
  module Source
    class Method < Element
      def initialize(json)
        super
      end

      def instance?
        kind.end_with? 'instance'
      end

      def class?
        kind.end_with? 'class'
      end

      def static?
        kind.end_with? 'static'
      end

      def parameters
        elements.select { |element| element.is_a? Variable }
      end

      def to_hash
        hash = super
        hash[:parameters] = parameters.map(&:to_hash)
        hash
      end

      def pretty_print
        { display_name => parameters.map(&:display_name) }
      end
    end
  end
end
