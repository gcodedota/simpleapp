require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:employee) { create(:employee, status: "inactivated") }
  describe 'login page' do
    it 'get login page' do
      post :create,  :email =>employee.email, :password => employee.password
      expect(response.body).to include("<html><body>You are being <a href=\"http://test.host/employees/#{employee.id}\">redirected</a>.</body></html>")
    end
    it 'get login page failed' do
      post :create,  :email =>employee.email, :password => "random password"
      expect(response).to render_template("new")    end
    it 'should activate user' do
      get :activate, :id => employee.id, :sent_time => Time.now.to_i
      expect(response.body).to include("<html><body>You are being <a href=\"http://test.host/employees/#{employee.id}\">redirected</a>.</body></html>")
    end
    it 'should not activate user if time expired' do
      get :activate, :id => employee.id, :sent_time => (Time.now - 1.hours).to_i
      expect(response).to render_template("new")
    end
    it 'logout' do
      post :create,  :email =>employee.email, :password => employee.password
      get :destroy
      expect(response).to redirect_to("/")
    end
  end
end
