require 'spec_helper'
require 'fileutils'

RSpec.describe Ssource do
  it 'has a version number' do
    expect(Ssource::VERSION).not_to be nil
  end

  it 'does something useful' do
    fixture = File.absolute_path('../fixtures/test.swift', __FILE__)
    json = Ssource::SourceKitten.structure fixture
    Ssource::Parser.parse json
    expect(json).not_to be_nil
  end
end
