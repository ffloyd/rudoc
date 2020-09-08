require 'rudoc/version'

module Rudoc
  class Error < StandardError; end

  module InheritanceCallback
    def inherited(mod)
      mod.singleton_class.prepend(InheritanceCallback)
      Rudoc::Registry.add_inheritance(self, mod)
      super
    end
  end

  class << self
    def extended(mod)
      Rudoc::Registry.add(mod)
      mod.singleton_class.prepend(InheritanceCallback)
    end
  end
end

require 'rudoc/registry'
