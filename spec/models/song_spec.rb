require "spec_helper"

describe Song do
  describe 'validation' do
    it 'Song has name each artist' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      song2 = Song.new :name => 'Automatic', :artist_id => artist.id
      song2.invalid?.should be_true
    end
  end

  describe '.singing!' do
    it 'count up SingLog' do
      artist = Artist.create! :name => 'Hikaru Utada'
      song1 = Song.create! :name => 'Automatic', :artist_id => artist.id
      count = SingLog.count
      song1.singing! 
      SingLog.count.should == count + 1
    end
  end

  describe '.artist_name=' do
    context 'when args is present' do
      it 'create artist' do
        song = Song.create! :name => 'whiteout', :artist_name => 'Garnet Crow' 
        Artist.where(name: 'Garnet Crow').present?.should be_true
      end
    end
    context 'args is blank' do
      pending 
    end
  end
end

