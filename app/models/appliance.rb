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

  def self.compare_warranty_period
    @appliances = Appliance.all
    require 'date'
    @appliances.each do |appliance|
      d1 = Date.today
      d2 = appliance.warranty_period
      if d1 == d2
      # @appliance = Appliance.find(appliance_id)
      # Appliance.const_get('User')
         NotificationMailer.send_when_arrival_warranty_period(appliance).deliver
      end
    end
  end
end
