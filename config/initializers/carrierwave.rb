CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJYK6FC7PE74YADCQ',                        # required
    :aws_secret_access_key  => 'AEPYZ/hetjw9ucOj/VkQIgRlYiPzpK5xPLPg4y/h',                        # required
    # :host                   => 's3.example.com',
    # :endpoint               => 'https://s3.example.com:8080'
  }
  config.fog_directory  = 'siskuploads'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
