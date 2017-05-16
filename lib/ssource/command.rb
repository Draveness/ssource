require 'claide'
require 'colorize'

module Ssource
  class Command < CLAide::Command
    require 'ssource/command/show'

    self.abstract_command = true
    self.command = 'ss'
    self.version = VERSION
    self.description = 'Ssrouce lets you parse swift file from Ruby.'

    def initialize(argv)
      super
    end

    attr_reader :file_path

    def file_path=(path)
      @file_path = path && Pathname.new(path).expand_path
    end
  end
end
