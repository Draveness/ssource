require_relative 'extension'

module Ssource
  module Source
    module Factory
      def self.build(json)
        const = case json['kind']
                when ->(kind) { kind.include? 'decl.var' } then Variable
                when ->(kind) { kind.include? 'decl.class' } then Klass
                when ->(kind) { kind.include? 'decl.function' } then Method
                when ->(kind) { kind.include? 'decl.extension' } then Extension
                else Element
                end
        const.new json
      end
    end
  end
end
