ActiveAdmin.register Category do
  permit_params do
    permitted = [:title, :parent_id]
    permitted
  end
  
  filter :title

  index do
    selectable_column
    column(:title) { |category| link_to "#{category.title}", admin_category_path(category) }
  end
  
  form do |f|
    inputs 'Основное' do
      input :title
      input :parent, collection: nested_set_options(Category, category) {|i| "#{'-' * i.level} #{i.title}" }
    end
    actions
  end

  show do
    h3 category.title
    attributes_table_for category do
      row :title
      row :parent
    end
  end

  sidebar 'Статистика', only: :show do
    attributes_table_for category do
      row :master_count
      row :form_count
    end
  end
end