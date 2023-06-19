require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
 render_views
 before(:each) do 
     @admin_user = FactoryBot.create(:admin_user)
     @category =FactoryBot.create(:category)
     @admin = AdminUser.find_or_create_by(email: 'admin@example.com')
     @admin.password = "password"
     @admin.save
     sign_in @admin
 end
  

  describe 'POST#new' do
    let!(:params) do {
      category_name: ( 'Category 1' ),
      category_id: (@category.id),
      }
    end
   it 'creates a new category' do
      post :new, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET#index' do
    it 'shows all the category' do 
      get :index
      expect(response).to have_http_status(200)   
   end  
  end
   
  describe 'GET#Show' do
    it 'shows all the category details' do
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(200)  
    end
  end
end

    