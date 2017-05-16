module Ssource
  module Source
    class Element
      attr_reader :name, :kind, :accessibility, :elements
      def initialize(json)
        @name = json['name']
        @accessibility = json['accessibility']
        @kind = json['kind']

        @elements = json.fetch('substructure', []).reduce([]) do |arr, structure|
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
        display_name
      end
    end
  end
end
