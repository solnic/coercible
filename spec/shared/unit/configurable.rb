shared_examples_for 'Configurable' do
  describe '.config_name' do
    subject { described_class.config_name }

    it { is_expected.to be_instance_of(Symbol) }
  end

  describe '.config_keys' do
    subject { described_class.config_keys }

    it { is_expected.to be_instance_of(Array) }
    it { is_expected.not_to be_empty }
  end

  describe '.config' do
    subject { described_class.config }

    it { is_expected.to be_instance_of(Coercible::Configuration) }

    it 'responds to configuration keys' do
      described_class.config_keys.each do |key|
        expect(subject).to respond_to(key)
        expect(subject).to respond_to("#{key}=")
      end
    end
  end
end
