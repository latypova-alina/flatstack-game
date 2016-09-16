ActiveAdmin.register Category do
  permit_params :name

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end
