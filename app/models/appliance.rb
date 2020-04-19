class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :category

  attachment :image

  def after_month
    @category = Category.find(category_id)
    d1 = start_operation
    d2 = @category.effective_life
    d = d1.since((d2 - 1).month)
    self.useful_life = d
  end
end
