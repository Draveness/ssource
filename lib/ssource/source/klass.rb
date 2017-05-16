# coding: utf-8
require_relative 'element'
require_relative 'method'
require_relative 'variable'

module Ssource
  module Source
    class Klass < Element
      attr_reader :superklass
      attr_reader :protocols

      def initialize(json)
        super
        inherited_types = json.fetch('inheritedtypes', []).map { |hash| hash['key.name'] }
        @superklass = inherited_types.first
        @protocols = inherited_types[1..-1] || []
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
        elements_variables.each_with_object(super) do |method, hash|
          collections = send(method).map(&:to_hash)
          hash[instance_variable.to_s.capitalize] = collections unless collections.empty?
        end
      end

      def pretty_print
        result = elements_variables.each_with_object({}) do |method, hash|
          collections = send(method).map(&:pretty_print)
          hash[method.to_s.capitalize] = collections unless collections.empty?
        end
        { display_name => result }
      end

      def elements_variables
        %i[variables instance_methods static_methods class_methods]
      end
    end
  end
end
