require 'spec_helper'

describe SingLogsController do

  before { test_sign_in }

  describe 'GET index' do
    it 'assigns @sing_logs' do
      sing_log = SingLog.create!
      get :index
      expect(assigns(:sing_logs)).to include sing_log
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the sing_log' do
      sing_log = SingLog.create!
      expect do
        delete :destroy, params: {id: sing_log}
      end.to change(SingLog, :count).by(-1)
    end
  end
end
