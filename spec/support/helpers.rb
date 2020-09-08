module Support
  module Helpers
    def named_module(name, &block)
      block ||= proc {}

      Module.new.tap do |mod|
        mod.singleton_class.define_method(:inspect) do
          name
        end

        instance_exec(mod, &block)
      end
    end

    def named_class(name, parent = Object, &block)
      block ||= proc {}

      Class.new(parent).tap do |klass|
        klass.singleton_class.define_method(:inspect) do
          name
        end

        instance_exec(klass, &block)
      end
    end
  end
end
