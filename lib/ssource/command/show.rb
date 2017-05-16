module Ssource
  class Command
    class Show < Command
      self.summary = 'Shows an overview of a swift file in a YAML representation.'

      def initialize(argv)
        self.file_path = argv.shift_argument
        super
      end

      def run
        require 'yaml'

        elements = Ssource::Source.from file_path
        sections = []
        elements.map(&:pretty_print).each do |key, value|
          section = key.green
          yaml = value.to_yaml
          yaml.gsub!(/^---$/, '')
          yaml.gsub!(/^-/, "\n-")
          yaml.prepend(section)
          sections << yaml
        end
        puts sections * '\n\n'
      end
    end
  end
end
