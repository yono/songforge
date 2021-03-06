require 'rails_helper'

describe Search do
  describe ".execute" do
    before :each do
      Song.delete_all
    end

    context 'without query' do
      it 'returns all of songs' do
        song1 = create(:song)
        song2 = create(:song)
        expect(Search.execute('')).to match_array([song1, song2])
      end

      it 'ordered by created_at DESC' do
        song1 = create(:song)
        song2 = create(:song)
        expect(Search.execute('')[0]).to eq(song2)
        expect(Search.execute('')[1]).to eq(song1)
      end
    end

    context 'with query' do
      context 'matching query' do
        it 'returns matched songs' do
          create(:song, name: 'SHAKE')
          song2 = create(:song, name: 'Thunderbird')
          expect(Search.execute('Thunderbird')).to include(song2)
        end
      end

      context 'unmatching query' do
        it 'does not return unmatched songs' do
          create(:song, name: 'SHAKE')
          song2 = create(:song, name: 'Thunderbird')
          expect(Search.execute('SHAKE')).to_not include(song2)
        end
      end
    end
  end
end
