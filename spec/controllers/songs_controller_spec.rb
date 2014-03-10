require 'spec_helper'

describe SongsController do

  describe 'GET index' do
    it 'assigns @songs' do
      song = Song.create! :name => 'Automatic'
      get :index
      expect(assigns(:songs)).to eq([song])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    pending
  end

  describe 'GET new' do
    pending
  end

  describe 'GET edit' do
    pending
  end

  describe 'POST create' do
    pending
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
