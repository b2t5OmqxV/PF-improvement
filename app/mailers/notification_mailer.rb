class NotificationMailer < ApplicationMailer
  def send_when_arrival_warranty_period(appliance)
    @appliance = appliance
    # pp @appliance.user[:email]
    # @appliance.user = appliance.user
    mail to: @appliance.user[:email],
    subject: '【家電 ChangeRecorder】メーカー保証期限到来のお知らせ'
  end

  def send_when_arrival_useful_life(user, appliance, contact)
    @appliances = Appliance.all
    require 'date'
    d1 = Date.today
    d2 = @appliances.useful_life
    if d1 == d2
    @appliance = find_by(appliance.id)
    mail to: @appliance.user.email, subject: '【家電 ChangeRecorder】有効寿命期限到来のお知らせ'
    end
  end
end
