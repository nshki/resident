Clearance.configure do |config|
  config.mailer_sender = "noreply@#{ENV.fetch('DOMAIN')}"
  config.rotate_csrf_on_sign_in = true
  config.allow_sign_up = false
end
