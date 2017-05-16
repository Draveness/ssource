module Ssource
  module Source
    class Element
      attr_reader :name, :kind, :accessibility, :elements

      attr_reader :offset, :length, :name_offset, :name_length, :body_offset, :body_length

      def initialize(json)
        @name = json['name']
        @accessibility = json['accessibility']
        @kind = json['kind']

        @offset = json['offset']
        @length = json['length']
        @name_offset = json['nameoffset']
        @name_length = json['namelength']
        @body_offset = json['bodyoffset']
        @body_length = json['bodylength']

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
