# coding: utf-8

require 'yaml'

module Ssource
  class Command
    class Show < Command
      self.summary = 'Shows an overview of a swift file in a YAML representation.'

      def initialize(argv)
        self.file_path = argv.shift_argument
        super
      end

      def run
        @root = Ssource::Source.from file_path
        puts sections * "\n\n"
      end

      private

      def sections
        [].tap do |sections|
          @root.pretty_print.each do |key, value|
            sections << yamlize(value).prepend(key.green)
          end
        end
      end

      def yamlize(value)
        yaml = value.to_yaml
        yaml.gsub!(/^---$/, '')
        yaml.gsub!(/^--- \[\]$/, '')
        yaml.gsub!(/^-/, "\n-")
        yaml
      end
    end
  end
end
