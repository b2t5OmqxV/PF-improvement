# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
	# default from: 'EMAIL_ADDRESS'
	default from: ENV['EMAIL_ADDRESS']
	layout 'mailer'
end
