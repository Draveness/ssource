require 'spec_helper'
require 'fileutils'

RSpec.describe Ssource do
  it 'has a version number' do
    expect(Ssource::VERSION).not_to be nil
  end

  it 'does something useful' do
    fixture = File.absolute_path('../fixtures/test.swift', __FILE__)
    puts Ssource::SourceKitten.structure fixture
    expect(false).to eq(true)
  end
end
