require 'rails_helper'

RSpec.describe OrganisationsController, type: :controller do
  let(:organisation) { Organisation.create(name: 'organisationName') }
  describe 'GET index' do
    before { allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil } }

    it 'assigns organisation' do
      get :index
      expect(assigns(:organisations)).to eq([organisation])
    end
  end
end
