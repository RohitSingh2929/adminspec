ActiveAdmin.register Brewery do
permit_params :name, :beer_style, :category_id, :subcategory_id

  index do
    selectable_column
    id_column
    column :name
    column :beer_style
    column :category_id
    column :subcategory_id
    actions
  end

  filter :name
  filter :beer_style
  filter :category_id
  filter :subcategory_id

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :beer_style
      f.input :category_id
      f.input :subcategory_id
    end
    f.actions
  end
end
