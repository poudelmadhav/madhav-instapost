ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'instapost.paudelmadhav.com.np',
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp
