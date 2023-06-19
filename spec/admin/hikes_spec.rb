# require 'rails_helper'

# RSpec.describe 'Admin Hike Controller', type: :feature do
#   let(:admin_user) { FactoryBot.create(:admin_user) } 

#   before do
#     sign_in admin_user
#   end

#   describe 'index' do
#     it 'displays the list of hikes' do
#       hike1 = create(:hike, name: 'Hike 1')
#       hike2 = create(:hike, name: 'Hike 2')

#       visit admin_hikes_path

#       expect(page).to have_content('Hikes')
#       expect(page).to have_content(hike1.name)
#       expect(page).to have_content(hike2.name)
#     end
#   end

#   describe 'new' do
#     let(:hike) { create(:hike) }  

#     it 'creates a new hike' do
#       visit new_admin_hike_path

#       fill_in 'Name', with: 'New Hike'
#       fill_in 'Difficulty', with: 'Easy'
#       fill_in 'Length', with: 10

#       click_button 'Create Hike'
#     end
#   end

#   describe 'edit' do
#     let(:hike) { create(:hike) }

#     it 'updates the hike' do
#       visit edit_admin_hike_path(hike)

#       fill_in 'Name', with: 'Updated Hike'
#       fill_in 'Difficulty', with: 'Easy'
#       fill_in 'Length', with: 20

#       click_button 'Update Hike'

#       expect(page).to have_content('Hike was successfully updated.')
#       expect(hike.reload.name).to eq('Updated Hike')
#       expect(hike.reload.difficulty).to eq('Easy')
#       expect(hike.reload.length).to eq(20)
#     end
#   end

#   describe 'destroy' do
#     let!(:hike) { create(:hike) }

#     it 'deletes the hike' do
#       visit admin_hikes_path

#       click_link 'Delete', href: admin_hike_path(hike)

#       expect(page).to have_content('Hike was successfully destroyed.')
#       expect(Hike.find_by(id: hike.id)).to be_nil
#     end
#   end
# end



require 'rails_helper'

RSpec.describe Admin::HikesController, type: :controller do
 render_views
 before(:each) do
   @admin_user = FactoryBot.create(:admin_user)
   @hike = FactoryBot.create(:hike)
   @category = FactoryBot.create(:category)
   @subcategory = FactoryBot.create(:subcategory)
   @admin = AdminUser.find_or_create_by(email: 'admin@example.com')
   @admin.password ="password"
   @admin.save
   sign_in @admin
 end

  describe 'POST#new' do
   let!(:params) do {
      hike_name: ('Lions head'),
      difficulty: ('medium'),
      length: ('11m'),
      category_id: (@category.id),
      subcategory_id: (@subcategory.id),
     }
   end
   it 'Creates a new hike' do 
     post :new, params:params
     expect(response).to have_http_status(200)
   end 
  end

  describe 'GET#index' do
     it 'shows all the hike' do
      get :index
      expect(response).to have_http_status(200)
   end
 end

  describe 'GET#show' do
   it 'shows all the hike details' do 
     get :show, params: { id: @hike.id} 
     expect(response).to have_http_status(200)
   end
  end
end 
