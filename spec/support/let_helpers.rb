module Support
  module LetHelpers
    def let_class(name, parent_proc = -> { Object }, &block)
      block ||= proc {}
      class_name = name.to_s.split('_').map(&:capitalize).join

      let(name) do
        named_class(class_name, instance_exec(&parent_proc), &block)
      end
    end

    def let_class!(name, parent_proc = -> { Object }, &block)
      block ||= proc {}
      class_name = name.to_s.split('_').map(&:capitalize).join

      let!(name) do
        named_class(class_name, instance_exec(&parent_proc), &block)
      end
    end

    def let_module(name, &block)
      block ||= proc {}
      mod_name = name.to_s.split('_').map(&:capitalize).join

      let(name) do
        named_module(mod_name, &block)
      end
    end

    def let_module!(name, &block)
      block ||= proc {}
      mod_name = name.to_s.split('_').map(&:capitalize).join

      let!(name) do
        named_module(mod_name, &block)
      end
    end
  end
end
