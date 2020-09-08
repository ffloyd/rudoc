module Rudoc
  module Registry
    class << self
      attr_reader :relations

      def add(mod)
        @registered.add(mod)
      end

      def registered?(mod)
        @registered.include?(mod)
      end

      def reset!
        @registered = Set.new
        @relations = ::Rudoc::Relations.new
      end
    end

    reset!
  end
end
