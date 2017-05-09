require 'json'

module Ssource
  module Factory
    class << self
      def build(json)
        const = case json['key.kind']
                when ->(kind) { kind.include? 'decl.var' } then Variable
                when ->(kind) { kind.include? 'decl.class' } then Klass
                when ->(kind) { kind.include? 'decl.function' } then Method
                else Element
                end
        result = const.new json
        p result
        result
      end
    end
  end

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
  end

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
  end

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
  end

  class Variable < Element
    attr_reader :typename
    def initialize(json)
      super
      @typename = json['key.typename']
    end
  end

  class Parser
    class << self
      def parse(json)
        klass = Factory.build json['key.substructure'].first
        p klass.instance_methods
        p klass.variables
      end
    end
  end
end
