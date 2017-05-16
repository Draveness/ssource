require_relative 'factory'
require_relative 'klass'

module Ssource
  module Source
    class RootObject
      extend Forwardable

      attr_reader :elements

      def initialize(file)
        elements = Ssource::SourceKitten.structure file
        @elements = elements.map { |element| Factory.build element }
      end

      def_delegators :@elements, :[], :first

      def self.from(file)
        Root.new(file)
      end

      def pretty_print
        %i[classes functions extensions].each_with_object({}) do |instance_variable, hash|
          collections = send(instance_variable).map(&:pretty_print)
          hash[instance_variable.to_s.capitalize] = collections unless collections.empty?
        end
      end

      def classes
        elements.select { |e| e.is_a? Klass }
      end

      def extensions
        elements.select { |e| e.is_a? Extension }
      end

      def functions
        elements.select { |e| e.is_a? Method }
      end
    end
  end
end
