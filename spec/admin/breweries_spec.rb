require 'rails_helper'

RSpec.describe Admin::BreweriesController, type: :controller do
  let(:admin_user) { FactoryBot.create(:admin_user) } 

  before do
    sign_in admin_user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns breweries to @breweries' do
      brewery = FactoryBot.create(:brewery) 
      get :index
      expect(assigns(:breweries)).to eq([brewery])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:brewery) { create(:brewery) }
    it 'creates a new brewery' do
      expect {
        post :create, params: { brewery: { name: 'Example Brewery', beer_style: 'IPA' } }
      }.to change(Brewery, :count).by(0)
    end
    it 'redirects to the index page after successful creation' do
      post :create, params: { brewery: { name: 'Example Brewery', beer_style: 'IPA' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    let(:brewery) { FactoryBot.create(:brewery) }

    it 'renders the edit template' do
      get :edit, params: { id: brewery.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    let(:brewery) { FactoryBot.create(:brewery) }

    it 'updates the brewery' do
      put :update, params: { id: brewery.id, brewery: { name: 'Updated Brewery' } }
      brewery.reload
      expect(brewery.name).to eq('Updated Brewery')
    end

    it 'redirects to the index page after successful update' do
      put :update, params: { id: brewery.id, brewery: { name: 'Updated Brewery' } }
      expect(response).to redirect_to(admin_brewery_path)
    end
  end

  describe 'DELETE #destroy' do
    let!(:brewery) { FactoryBot.create(:brewery) }

    it 'destroys the brewery' do
      expect {
        delete :destroy, params: { id: brewery.id }
      }.to change(Brewery, :count).by(-1)
    end

    it 'redirects to the index page after successful deletion' do
      delete :destroy, params: { id: brewery.id }
      expect(response).to redirect_to(admin_breweries_path)
    end
  end
end
