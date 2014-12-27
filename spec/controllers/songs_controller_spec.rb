require 'spec_helper'

describe SongsController do

  describe 'GET index' do
    it 'assigns @songs' do
      song = create(:song)
      get :index
      expect(assigns(:songs)).to include song
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do
    it 'assigns song to @song' do
      song = create(:song)
      get :show, id: song
      expect(assigns(:song)).to eq(song)
    end
  end

  describe 'GET new' do
    context 'without artist_id' do
      it 'assigns a new Song to @song' do
        get :new
        expect(assigns(:song)).to be_a_new(Song)
      end

      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'with artist_id' do
      it 'assigns a new Song with Artist to @song' do
        artist = Artist.create! name: 'Artist'
        get :new, artist_id: artist
        expect(assigns(:song).artist_id).to eq(artist.id)
      end
    end
  end

  describe 'GET edit' do
    it 'assigns the requested song to @song' do
      song = create(:song)
      get :edit, id: song
      expect(assigns(:song)).to eq(song)
    end

    it 'renders the :edit template' do
      song = create(:song)
      get :edit, id: song
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      context 'without artist_name param' do
        it 'creates a new song' do
          expect do
            post :create, song: attributes_for(:song)
          end.to change(Song, :count).by(1)
        end

        it 'redirects to songs#show' do
          post :create, song: attributes_for(:song)
          expect(response).to redirect_to song_url(assigns[:song])
        end
      end

      context 'with artist_name param' do
        it 'creates a new artist' do
          expect do
            post :create, song: attributes_for(:song_with_artist)
          end.to change(Artist, :count).by(1)
        end
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new song' do
        expect do
          post :create, song: attributes_for(:invalid_song)
        end.to_not change(Song, :count)
      end

      it 're-renders the :new template' do
        post :create, song: attributes_for(:invalid_song)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      it 'update the song' do
        song = create(:song)
        patch :update, id: song, song: attributes_for(:song, name: 'NewSong')
        song.reload
        expect(song.name).to eq('NewSong')
      end

      it 'redirects to songs#show' do
        song = create(:song)
        patch :update, id: song, song: attributes_for(:song)
        expect(response).to redirect_to song
      end
    end

    context 'with invalid attributes' do
      it 'does not update the song' do
        song = create(:song, name: 'ExistSong')
        patch :update, id: song, song: attributes_for(:invalid_song)
        song.reload
        expect(song.name).to eq('ExistSong')
      end

      it 're-renders the :edit template' do
        song = create(:song)
        post :update, id: song, song: attributes_for(:invalid_song)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the song' do
      song = create(:song)
      expect do
        delete :destroy, id: song
      end.to change(Song, :count).by(-1)
    end

    it 'redirects to songs#index' do
      song = create(:song)
      delete :destroy, id: song
      expect(response).to redirect_to songs_url
    end
  end

  describe 'GET singing' do
    it 'creates a new sing_log' do
      song = create(:song)
      expect do
        get :singing, id: song
      end.to change(SingLog, :count).by(1)
    end

    it 'redirects to songs#index' do
      song = create(:song)
      get :singing, id: song
      expect(response).to redirect_to songs_url
    end
  end

end
