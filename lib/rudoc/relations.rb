module Rudoc
  class Relations
    attr_reader :inheritance_map, :include_map, :extend_map, :prepend_map

    def initialize
      @inheritance_map = {}
      @include_map = {}
      @extend_map = {}
      @prepend_map = {}
    end

    def add_inheritance(parent, child)
      @inheritance_map[parent] ||= Set.new
      @inheritance_map[parent].add(child)
    end

    def add_include(mod, target)
      @include_map[mod] ||= Set.new
      @include_map[mod].add(target)
    end

    def add_extend(mod, target)
      @extend_map[mod] ||= Set.new
      @extend_map[mod].add(target)
    end

    def add_prepend(mod, target)
      @prepend_map[mod] ||= Set.new
      @prepend_map[mod].add(target)
    end
  end
end
