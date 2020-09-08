# rubocop:disable RSpec/DescribedClass
RSpec.describe Rudoc do
  include_context 'with helpers'

  after { Rudoc::Registry.reset! }

  it 'has a version number' do
    expect(Rudoc::VERSION).not_to be nil
  end

  context 'when module exteded with Rudoc' do
    let_module!(:mod) { |mod| mod.extend Rudoc }

    it 'register module in Rudoc::Registry' do
      expect(Rudoc::Registry.registered?(mod)).to be true
    end
  end

  context 'when class extended with Rudoc and has childs' do
    let_class!(:parent_class) do |klass|
      klass.extend Rudoc
    end

    let_class!(:child_class, -> { parent_class })
    let_class!(:child_of_child, -> { child_class })
    let_class!(:second_child_of_child, -> { child_class })

    let(:expected_inheritance_map) do
      {
        parent_class => Set[child_class],
        child_class => Set[child_of_child, second_child_of_child]
      }
    end

    include_examples 'registration check',
                     include_proc: -> { [parent_class] },
                     exclude_proc: -> { [child_class, child_of_child, second_child_of_child] }

    it 'registers correct inheritance map' do
      expect(Rudoc::Registry.relations.inheritance_map).to eq expected_inheritance_map
    end
  end

  context 'when module extended with Rudoc and included into other modules' do
    let_module!(:mod) do |mod|
      mod.extend Rudoc
    end

    let_module!(:child_mod) { |this| this.include mod }
    let_class!(:class_with_child_mod) { |this| this.include child_mod }
    let_module!(:mod_with_child_mod) { |this| this.include child_mod }

    let(:expected_include_map) do
      {
        mod => Set[child_mod],
        child_mod => Set[class_with_child_mod, mod_with_child_mod]
      }
    end

    include_examples 'registration check',
                     include_proc: -> { [mod] },
                     exclude_proc: -> { [child_mod, class_with_child_mod, mod_with_child_mod] }

    it 'registers correct includings map' do
      expect(Rudoc::Registry.relations.include_map).to eq expected_include_map
    end
  end

  context 'when module extended with Rudoc and extened into other modules' do
    let_module!(:mod) do |mod|
      mod.extend Rudoc
    end

    let_module!(:child_mod) { |this| this.extend mod }
    let_class!(:class_with_child_mod) { |this| this.extend child_mod }
    let_module!(:mod_with_child_mod) { |this| this.extend child_mod }

    let(:expected_extend_map) do
      {
        mod => Set[child_mod],
        child_mod => Set[class_with_child_mod, mod_with_child_mod]
      }
    end

    include_examples 'registration check',
                     include_proc: -> { [mod] },
                     exclude_proc: -> { [child_mod, class_with_child_mod, mod_with_child_mod] }

    it 'registers correct extendings map' do
      expect(Rudoc::Registry.relations.extend_map).to eq expected_extend_map
    end
  end

  context 'when module extended with Rudoc and prepended into other modules' do
    let_module!(:mod) do |mod|
      mod.extend Rudoc
    end

    let_module!(:child_mod) { |this| this.prepend mod }
    let_class!(:class_with_child_mod) { |this| this.prepend child_mod }
    let_module!(:mod_with_child_mod) { |this| this.prepend child_mod }

    let(:expected_prepend_map) do
      {
        mod => Set[child_mod],
        child_mod => Set[class_with_child_mod, mod_with_child_mod]
      }
    end

    include_examples 'registration check',
                     include_proc: -> { [mod] },
                     exclude_proc: -> { [child_mod, class_with_child_mod, mod_with_child_mod] }

    it 'registers correct prependings map' do
      expect(Rudoc::Registry.relations.prepend_map).to eq expected_prepend_map
    end
  end
end
# rubocop:enable RSpec/DescribedClass
