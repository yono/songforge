require "spec_helper"
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
    expect{
      song.singing! 
    }.to change(SingLog, :count).by(1)
  end

  describe '.sang?' do
    context 'when not sang' do
      its(:sang?) { should be_false }
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
      its(:youtube_v) { should be_nil }
    end

    context 'has movie_url' do
      it 'returns value' do
        song = create(:song)
        song.movie_url = 'http://www.youtube.com/watch?v=abcdefghi'
        expect(song.youtube_v).to eq "abcdefghi"
      end
    end
  end

  describe '.has_movie?' do
    context 'when has no movie_uel' do
      before { song.movie_url = nil }
      its(:have_movie?) { false }
    end

    context 'when has movie_url' do
      before { song.movie_url = 'http://www.youtube.com/watch?v=abcdefghi' }
      its(:have_movie?) { true }
    end
  end

  describe '.lyrics_file=' do
    before do
      tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
      tempfile.stub(:content_type).and_return('image/jpeg')
      tempfile.stub(:read).and_return('binary')
      song.lyrics_file = tempfile
    end

    its(:content_type) { "image/jpeg" }
  end

  describe '.has_lyrics_file?' do
    context 'when has no lyrics file' do
      its(:has_lyrics_file?) { false }
    end

    context 'when has lyrics file' do
      before do
        tempfile = Tempfile::new("test.jpg", "#{Rails.root}/spec/images")
        tempfile.stub(:content_type).and_return('image/jpeg')
        tempfile.stub(:read).and_return('binary')
        song.lyrics_file = tempfile
      end

      its(:has_lyrics_file?) { true }
    end
  end

  describe '.artist_name' do
    its(:artist_name) { nil }
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
          it "create artist" do
            expect(Artist.where(name: 'Garnet Crow').present?).to be true
          end
        end
      end
    end

    context 'args is blank' do
      it 'create no artist' do
        expect {
          new_song = build(:song)
        }.to change(Artist, :count).by(0)
      end
    end
  end
end
