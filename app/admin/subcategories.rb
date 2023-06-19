ActiveAdmin.register Subcategory do
 permit_params :name, :category_id


 index do
  selectable_column
  id_column
  column :name
  column :category_id
  actions
end

filter :name
filter :category_id

form do |f|
  f.inputs do
    f.input :name
    f.input :category_id
  end
  f.actions
 end
end
