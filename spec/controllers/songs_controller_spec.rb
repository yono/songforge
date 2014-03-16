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
    pending
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
      it 'creates a new song' do
        expect {
          post :create, song: attributes_for(:song)
        }.to change(Song, :count).by(1)
      end

      it 'redirects to songs#show' do
        post :create, song: attributes_for(:song)
        expect(response).to redirect_to song_url(assigns[:song])
      end
    end
  end

  describe 'PUT update' do
    pending
  end

  describe 'DELETE destroy' do
    pending
  end

  describe 'GET singing' do
    pending
  end

  describe 'GET lyrics_image' do
    pending
  end

end
