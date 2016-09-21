CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['access_key_id'],
    aws_secret_access_key:  ENV['secret_access_key'],
    region: 'us-west-2',
    path_style: true
  }
  config.fog_directory    = ENV['S3_BUCKET_NAME']
end
