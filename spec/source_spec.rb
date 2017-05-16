require 'spec_helper'
require 'fileutils'
require 'active_support'

RSpec.describe Ssource::Source do
  context 'when parsing class' do
    it 'parses different kinds of methods' do
      fixture = Fixture.filepath 'methods.swift'
      content = Ssource::Source.from fixture
      klass = content.first
      methods = klass.methods
      instance_methods = klass.instance_methods.map(&:name)
      class_methods = klass.class_methods.map(&:name)
      static_methods = klass.static_methods.map(&:name)
      puts klass.pretty_print

      expect(klass).to be_instance_of(Ssource::Source::Klass)
      expect(methods.count).to be(3)
      expect(instance_methods).to match_array('method()')
      expect(class_methods).to match_array('classMethod()')
      expect(static_methods).to match_array('staticMethod()')
    end
  end

  context 'when parsing methods' do
    it 'parses function parameters' do
      fixture = Fixture.filepath 'function.swift'
      content = Ssource::Source.from fixture
      function = content.first
      parameters = function.parameters
      first_parameter = parameters.first
      second_parameter = parameters[1]
      third_parameter = parameters[2]

      expect(function).to be_instance_of(Ssource::Source::Method)
      expect(parameters.count).to be(3)

      expect(first_parameter.typename).to eq('Int')
      expect(second_parameter.typename).to eq('Double')
      expect(third_parameter.typename).to eq('() -> ()')

      expect(first_parameter.name).to eq('inInteger')
      expect(second_parameter.name).to eq('float')
      expect(third_parameter.name).to eq('closure')
    end
  end
end
