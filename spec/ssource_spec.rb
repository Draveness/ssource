require 'spec_helper'
require 'fileutils'

RSpec.describe Ssource do
  it 'has a version number' do
    expect(Ssource::VERSION).not_to be nil
  end

  it 'does something useful' do
    fixture = Fixture.filepath 'test.swift'
    json = Ssource::SourceKitten.structure fixture
    expect(json).not_to be_nil
  end
end
