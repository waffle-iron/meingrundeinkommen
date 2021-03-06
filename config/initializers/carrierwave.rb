CarrierWave.configure do |config|
  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.fog_credentials = {
    provider:              'AWS', # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'], # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # required
    region:                ENV['S3_REGION'], # optional, defaults to 'us-east-1'
    # host:                ENV'',             # optional, defaults to nil
    # endpoint:            'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME'] # required
  config.fog_public     = true # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{1.year.to_i}" } # optional, defaults to {}

  config.asset_host = ENV['CDN_URL'] if Rails.env.production?
end
