RSpec.shared_examples 'registration check' do |include_proc:, exclude_proc: false|
  it 'has expected registered mods' do
    instance_exec(&include_proc).each do |mod|
      expect(Rudoc::Registry.registered?(mod)).to be(true),
                                                  "expected #{mod} to be registered, but it's not"
    end
  end

  if exclude_proc
    it 'has no unexpected registered mods' do
      instance_exec(&exclude_proc).each do |mod|
        expect(Rudoc::Registry.registered?(mod)).to be(false),
                                                    "expected #{mod} to not be registered, but it's registered"
      end
    end
  end
end
