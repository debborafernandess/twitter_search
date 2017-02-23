RSpec.describe MentionSearcher do
  before do
    @response = {
      'statuses' => [
        {
          'screen_name' => 'john_doe',
          'text' => 'If we @o_lisette_reilly wireless HDD protocol',
          'in_reply_to_user_id' => ''
        },
        {
          'screen_name' => 'jane_doe',
          'text' => 'If we generate the program, we can get @locaweb',
          'in_reply_to_user_id' => 42,
        },
        {
          'screen_name' => 'katlyn_iii_boyer',
          'text' => 'If we generate the program, we can get to @locaweb',
          'in_reply_to_user_id' => 642,
        }
      ]
    }
  end

  context '.all' do
    context 'when API Client returns a empty response' do
      it 'returns an empty hash' do
        allow(Client).to receive(:search).and_return({})

        expect(described_class.all).to eq([])
      end
    end

    context 'when API Client returns a not empty response' do
      it 'returns mentions to @locaweb' do
        allow(Client).to receive(:search).and_return(@response)

        expect(described_class.all)
          .to eq([{
            "screen_name" => "jane_doe",
            "text" => "If we generate the program, we can get @locaweb",
            "in_reply_to_user_id" => 42
           },
           {
             "screen_name" => "katlyn_iii_boyer",
             "text" => "If we generate the program, we can get to @locaweb",
             "in_reply_to_user_id" => 642
           }])

        expect(described_class.all)
          .not_to match(hash_including('screen_name' => 'john_doe'))
      end
    end
  end

  context '.without_replies' do
    context 'when API Client returns a empty response' do
      it 'returns an empty hash' do
        allow(Client).to receive(:search).and_return({})

        expect(described_class.without_replies).to eq([])
      end
    end

    context 'when API Client returns a not empty response' do
      it 'returns only mentions that are not replies to @locaweb' do
        allow(Client).to receive(:search).and_return(@response)

        expect(described_class.without_replies)
          .to include(hash_including('screen_name' => 'katlyn_iii_boyer'))
        expect(described_class.without_replies)
          .not_to include(hash_including('screen_name' => 'jane_doe'))
      end
    end
  end
end
