class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :categorie

  attachment :image
end
