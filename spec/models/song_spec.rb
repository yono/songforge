require 'rails_helper'
require 'tempfile'

describe Song do
  let(:song) { create(:song) }

  describe 'validation' do
    it "can't have same name wth a same artist" do
      artist = create(:artist)
      song.artist_id = artist.id
      song.save
      duplicate_song = build(:song, name: song.name, artist_id: artist.id)

      expect(duplicate_song.invalid?).to be true
    end
  end

  it '.singing!' do
    expect do
      song.singing!
    end.to change(SingLog, :count).by(1)
  end

  describe '.sang?' do
    context 'when not sang' do
      it 'return false' do
        expect(song.sang?).to be false
      end
    end

    context 'when already sang' do
      it 'returns true' do
        song = create(:song)
        song.singing!
        expect(song.sang?).to be true
      end
    end
  end

  describe '.youtube_v' do
    context 'has no movie_url' do
      before { song.movie_url = nil }
      it 'returns nil' do
        expect(song.youtube_v).to be_nil
      end
    end

    context 'has movie_url' do
      it 'returns value' do
        song = create(:song)
        song.movie_url = 'http://www.youtube.com/watch?v=abcdefghi'
        expect(song.youtube_v).to eq 'abcdefghi'
      end
    end
  end

  describe '.has_movie?' do
    context 'when has no movie_uel' do
      before { song.movie_url = nil }
      it 'return false' do
        expect(song.has_movie?).to be false
      end
    end

    context 'when has movie_url' do
      before { song.movie_url = 'http://www.youtube.com/watch?v=abcdefghi' }
      it 'return true' do
        expect(song.has_movie?).to be true
      end
    end
  end

  describe '.artist_name' do
    it 'return nil' do
      expect(song.artist_name).to be_nil
    end
  end

  describe '.artist_name=' do
    context 'when args is present' do
      before { song.artist_name = 'Garnet Crow' }

      context 'before save' do
        it "doesn't create artist" do
          expect(Artist.where(name: 'Garnet Crow').present?).to be false
        end

        context 'after save' do
          before { song.save }
          it 'create artist' do
            expect(Artist.where(name: 'Garnet Crow').present?).to be true
          end

          it 'song belong to the artist' do
            expect(song.artist.name).to eq(song.artist_name)
          end
        end
      end
    end

    context 'args is blank' do
      it 'create no artist' do
        expect { build(:song) }.to change(Artist, :count).by(0)
      end
    end
  end
end
