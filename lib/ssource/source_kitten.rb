require 'json'

module Ssource
  module SourceKitten
    class << self
      def syntax(file)
        JSON.parse `sourcekitten syntax --file #{file}`
      end

      def structure(file)
        JSON.parse `sourcekitten structure --file #{file}`
      end
    end
  end
end
