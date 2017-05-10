module Fixture
  def self.read(file)
    File.read Fixture.filepath(file)
  end

  def self.filepath(file)
    File.absolute_path "../../fixtures/#{file}", __FILE__
  end
end
