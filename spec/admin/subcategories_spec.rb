require 'rails_helper'

RSpec.describe  Admin::SubcategoriesController, type: :controller do
  render_views
  before(:each) do
    @admin_user =  FactoryBot.create(:admin_user)
    @subcategory = FactoryBot.create(:subcategory)
    @category = FactoryBot.create(:category)
    @admin = AdminUser.find_or_create_by(email: 'admin@example.com')
    @admin.password = "password"
    @admin.save
    sign_in @admin
  end

  describe 'POST#new' do
    let!(:params) do {
      subcategory_name: ('Beer Style'),
      subcategory_id: (@subcategory.id),
      category_id: (@category.id),
    }
    end
    it 'creates a plan' do
      post :new, params: params
      expect(response).to have_http_status(200)
    end

  end

  describe 'GET#index' do
    it 'shows all data' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET#show' do
    it 'show subcategory details' do
      get :show, params: { id: @subcategory.id }
      expect(response).to have_http_status(200)
    end
  end
end