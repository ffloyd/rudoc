require 'rudoc/version'

module Rudoc
  class Error < StandardError; end

  class << self
    def extended(mod)
      Rudoc::Registry.add(mod)
      mod.singleton_class.prepend(RelationsCallback)
    end
  end
end

require 'rudoc/relations'
require 'rudoc/relations_callback'
require 'rudoc/registry'
