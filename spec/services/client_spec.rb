RSpec.describe Client do
  context '.search' do
    it 'returns a JSON response' do
      allow(described_class).to receive(:URI).and_return({ 'statuses': [] })

      expect(described_class.search).to be_kind_of(Hash)
      expect(described_class.search).to include('statuses')
    end
  end
end
