require 'spec_helper'

describe ArtistsController do

  describe 'GET index' do
    it 'assigns artists to @artists' do
      artist = create(:artist)
      get :index
      expect(assigns(:artists)).to include artist
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do
    it 'assigns the artist to @artist' do
      artist = create(:artist)
      get :show, id: artist
      expect(assigns(:artist)).to eq artist
    end

    it 'renders the :show template' do
      artist = create(:artist)
      get :show, id: artist
      expect(response).to render_template :show
    end
  end

  describe 'GET new' do
    it 'assigns a new Artist to @artist' do
      get :new
      expect(assigns(:artist)).to be_a_new(Artist)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it 'assigns the requested Artist to @artist' do
      artist = create(:artist)
      get :edit, id: artist
      expect(assigns(:artist)).to eq artist
    end

    it 'renders the :edit template' do
      artist = create(:artist)
      get :edit, id: artist
      expect(response).to render_template :edit
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'creates a new artist' do
        expect {
          post :create, artist: attributes_for(:artist)
        }.to change(Artist, :count).by(1)
      end

      it 'redirects to artists#show' do
        post :create, artist: attributes_for(:artist)
        expect(response).to redirect_to artist_url(assigns[:artist])
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new artist' do
        expect {
          post :create, artist: attributes_for(:invalid_artist)
        }.to_not change(Artist, :count)
      end

      it 're-renders the :new template' do
        post :create, artist: attributes_for(:invalid_artist)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      it 'updates the artist' do
        artist = create(:artist, name: 'ORIGINAL')
        patch :update, id: artist, artist: attributes_for(:artist, name: 'UPDATED')
        artist.reload
        expect(artist.name).to eq("UPDATED")
      end

      it 'redirects to artists#show' do
        artist = create(:artist)
        patch :update, id: artist, artist: attributes_for(:artist)
        expect(response).to redirect_to artist_url(artist)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the artist' do
        artist = create(:artist, name: 'VALID')
        patch :update, id: artist, artist: attributes_for(:invalid_artist)
        artist.reload
        expect(artist.name).to eq("VALID")
      end

      it 're-renders the :edit template' do
        artist = create(:artist, name: 'VALID')
        patch :update, id: artist, artist: attributes_for(:invalid_artist)
        expect(response).to render_template 'edit'
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the artist' do
      artist = create(:artist)
      expect {
        delete :destroy, id: artist
      }.to change(Artist, :count).by(-1)
    end

    it 'redirects to artists#index' do
      artist = create(:artist)
      delete :destroy, id: artist
      expect(response).to redirect_to artists_url
    end
  end
end
