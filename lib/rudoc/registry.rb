module Rudoc
  module Registry
    @registered = {}
    @inheritance_map = {}

    class << self
      attr_reader :inheritance_map

      def add(mod)
        @registered[mod] = true
      end

      def registered?(mod)
        @registered.key?(mod)
      end

      def add_inheritance(from, to)
        inheritance_map[from] ||= []
        inheritance_map[from] << to unless inheritance_map[from].include?(to)
      end

      def reset!
        @registered = {}
        @inheritance_map = {}
      end
    end
  end
end
