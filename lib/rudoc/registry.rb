module Rudoc
  module Registry
    @registered = {}

    class << self
      def add(mod)
        @registered[mod] = true
      end

      def registered?(mod)
        @registered.key?(mod)
      end
    end
  end
end
