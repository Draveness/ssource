require 'active_support'
require 'ssource/version'

module Ssource
  extend ActiveSupport::Autoload

  autoload :SourceKitten
  autoload :Source
end
