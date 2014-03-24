require 'spec_helper'

describe SingLogsController do
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
end
