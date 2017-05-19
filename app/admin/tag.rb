ActiveAdmin.register Tag do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :avatar


form(:html => { :multipart => true }) do |f|
  f.input :name
  f.input :avatar, :as => :file
  f.actions
end

end
