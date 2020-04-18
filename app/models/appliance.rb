class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :categorie

  attachment :image

  def after_month
    @categorie = Categorie.find(category_id)
    d1 = start_operation
    d2 = @categorie.effective_life
    d = d1.since((d2 - 1).month)
    self.useful_life = d
  end
end
