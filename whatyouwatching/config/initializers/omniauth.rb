Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
    :scope => 'user_friends, user_likes, user_about_me', :display => 'popup'

end