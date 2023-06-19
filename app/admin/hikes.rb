ActiveAdmin.register Hike do 
  permit_params :name, :difficulty, :length, :category_id, :subcategory_id

  index do
    selectable_column
    id_column
    column :name
    column :difficulty
    column :length
    column :category_id
    column :subcategory_id
    actions
  end

  filter :name
  filter :difficulty
  filter :length
  filter :category_id
  filter :subcategory_id

  form do |f|
    # f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :difficulty
      f.input :length
      f.input :category_id
      f.input :subcategory_id
    end
    f.actions
  end
end 
