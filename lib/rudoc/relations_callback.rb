module Rudoc
  module RelationsCallback
    def inherited(mod)
      mod.singleton_class.prepend(RelationsCallback)
      Rudoc::Registry.relations.add_inheritance(self, mod)
      super
    end

    def included(mod)
      mod.singleton_class.prepend(RelationsCallback)
      Rudoc::Registry.relations.add_include(self, mod)
      super
    end

    def extended(mod)
      mod.singleton_class.prepend(RelationsCallback)
      Rudoc::Registry.relations.add_extend(self, mod)
      super
    end

    def prepended(mod)
      mod.singleton_class.prepend(RelationsCallback)
      Rudoc::Registry.relations.add_prepend(self, mod)
      super
    end
  end
end
