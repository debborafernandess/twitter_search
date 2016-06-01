RSpec.describe Client do
  describe 'Send url according requested path' do
    it 'without path' do
      client = Client.new
      route  = nil

      expect(client.send(:url, route)).to eq(client.send(:base_url))
    end

    it 'with path' do
      client = Client.new
      route  = '/search/tweets.json'

      expect(client.send(:url, route)).to eq("#{client.send(:base_url)}#{route}")
    end
  end

  describe 'Send get request' do
    it do
      client = Client.new

      expect(client.get).to be_kind_of(String)
    end
  end

  describe 'Parse response' do
    it do
      client = Client.new
      client.get

      expect(client.response).to be_kind_of(Hash)
      expect(client.response.keys).to include('statuses')
    end
  end
end
