require 'rudoc/version'

module Rudoc
  class Error < StandardError; end

  class << self
    def extended(mod)
      Rudoc::Registry.add(mod)
    end
  end
end

require 'rudoc/registry'
