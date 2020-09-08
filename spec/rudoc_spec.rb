# rubocop:disable RSpec/DescribedClass
RSpec.describe Rudoc do
  after { Rudoc::Registry.reset! }

  it 'has a version number' do
    expect(Rudoc::VERSION).not_to be nil
  end

  context 'when module exteded with Rudoc' do
    before { mod.extend Rudoc }

    let(:mod) { Module.new }

    it 'register module in Rudoc::Registry' do
      expect(Rudoc::Registry.registered?(mod)).to be true
    end
  end

  context 'when class extended with Rudoc and has childs' do
    let!(:parent_class) do
      Class.new.tap do |klass|
        klass.extend Rudoc
      end
    end

    let!(:child_class) { Class.new(parent_class) }
    let!(:child_of_child) { Class.new(child_class) }
    let!(:second_child_of_child) { Class.new(child_class) }

    it 'parent class is registered' do
      expect(Rudoc::Registry.registered?(parent_class)).to be true
    end

    it 'child class is not registered' do
      expect(Rudoc::Registry.registered?(child_class)).to be false
    end

    it 'child of child is not registered' do
      expect(Rudoc::Registry.registered?(child_of_child)).to be false
    end

    it 'registers correct inheritance map' do
      expect(Rudoc::Registry.inheritance_map).to eq({
                                                      parent_class => [child_class],
                                                      child_class => [child_of_child, second_child_of_child]
                                                    })
    end
  end
end
# rubocop:enable RSpec/DescribedClass
