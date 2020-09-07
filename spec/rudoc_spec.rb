RSpec.describe Rudoc do
  it 'has a version number' do
    expect(Rudoc::VERSION).not_to be nil
  end

  context 'when module exteded with Rudoc' do
    before { mod.extend described_class }

    let(:mod) { Module.new }

    it 'register module in Rudoc::Registry' do
      expect(described_class::Registry.registered?(mod)).to be true
    end
  end
end
