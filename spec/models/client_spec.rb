RSpec.describe Client do
  describe '#get' do
    it 'Unauthorized' do
      client = Client.new(nil)

      expect(client.get).to eq('Unauthorized')
    end

    it 'Authorized' do
      client = Client.new(username: Faker::Internet.email)
      request = client.get

      expect(request).not_to be_empty
    end
  end
end
