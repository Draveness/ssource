module Ssource
  module Source
    class Element
      attr_reader :name, :kind, :accessibility, :elements
      def initialize(json)
        @name = json['key.name']
        @accessibility = json['key.accessibility']
        @kind = json['key.kind']

        @elements = json.fetch('key.substructure', []).reduce([]) do |arr, structure|
          arr << Factory.build(structure)
        end
      end

      def display_name
        name
      end

      def to_hash
        { 'name' => display_name }
      end

      def pretty_print
        dispay_name
      end
    end
  end
end
