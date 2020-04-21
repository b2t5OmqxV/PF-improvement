class NotificationMailer < ApplicationMailer
  def send_when_arrival_warranty_period(appliance)
    @appliance = appliance
    mail to: @appliance.user[:email], subject: '【家電 ChangeRecorder】メーカー保証期限到来のお知らせ'
  end

  def send_when_arrival_useful_life(appliance)
    @appliance = appliance
    mail to: @appliance.user[:email], subject: '【家電 ChangeRecorder】有効寿命期限到来のお知らせ'
  end
end
