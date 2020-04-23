class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :category

  attachment :image

  validates :maker, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :useful_life, presence: true

  def after_month
    @category = Category.find(category_id)
    d1 = start_operation
    d2 = @category.effective_life
    d = d1&.since((d2 - 1).month)
    self.useful_life = d
  end

  def self.compare_warranty_period
    @appliances = Appliance.all
    require 'date'
    @appliances.each do |appliance|
      d1 = Date.today
      d2 = appliance.warranty_period
      d3 = d1.since((d2 - 1).month)
      d1 == d3 if NotificationMailer.send_when_arrival_warranty_period(appliance).deliver
    end
  end

  def self.compare_useful_life
    @appliances = Appliance.all
    require 'date'
    @appliances.each do |appliance|
      d1 = Date.today
      d2 = appliance.useful_life
      d1 == d2 if NotificationMailer.send_when_arrival_useful_life(appliance).deliver
    end
  end

  def self.search(search, appliance_or_user)
    if appliance_or_user == '1'
      Appliance.where(['maker LIKE? OR product LIKE? OR model LIKE?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Appliance.all
    end
  end
end
