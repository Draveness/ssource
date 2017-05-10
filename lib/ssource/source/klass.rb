module Ssource
  module Source
    class Klass < Element
      def initialize(json)
        super
      end

      def methods
        elements.select { |element| element.is_a? Method }
      end

      def instance_methods
        methods.select(&:instance?)
      end

      def static_methods
        methods.select(&:static?)
      end

      def class_methods
        methods.select(&:class?)
      end

      def variables
        elements.select { |element| element.is_a? Variable }
      end

      def to_hash
        hash = super
        hash['variables'] = variables.map(&:to_hash)
        hash['instance_methods'] = instance_methods.map(&:to_hash)
        hash['static_methods'] = static_methods.map(&:to_hash)
        hash['class_methods'] = class_methods.map(&:to_hash)
        hash
      end

      def pretty_print
        hash = {}
        hash['variables'] = variables.map(&:pretty_print)
        hash['instance_methods'] = instance_methods.map(&:pretty_print)
        hash['static_methods'] = static_methods.map(&:pretty_print)
        hash['class_methods'] = class_methods.map(&:pretty_print)
        { display_name => hash }
      end
    end
  end
end
