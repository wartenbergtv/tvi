Cloudinary.config do |config|
  config.cloud_name = Rails.application.config.cloudinary_cloud_name
  config.api_key = Rails.application.config.cloudinary_api_key
  config.api_secret = Rails.application.config.cloudinary_api_secret
  config.secure = true
  config.cdn_subdomain = true
end
