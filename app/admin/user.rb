ActiveAdmin.register User do
  permit_params :email, :full_name, :password, :password_confirmation, :role

  index do
    column :full_name
    column :email
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :full_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end
end