require 'json'
require 'active_support/core_ext'

class Hash
  def purify_hash
    hash = transform_keys do |key|
      return value unless key.start_with? 'key.'
      key[4..-1]
    end
    substructure = hash['substructure']
    return hash unless substructure
    hash['substructure'] = substructure.map(&:purify_hash)
    hash
  end
end

module Ssource
  module SourceKitten
    class << self
      def syntax(file)
        JSON.parse `sourcekitten syntax --file #{file}`
      end

      def structure(file)
        json = JSON.parse `sourcekitten structure --file #{file}`
        json['key.substructure'].map(&:purify_hash)
      end
    end
  end
end
