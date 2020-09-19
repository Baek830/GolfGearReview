require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.test?
    config.storage = :file
  # else
  #   config.storage = :fog
  #   config.fog_provider = 'fog/aws'  #=> 追加
  #   config.fog_credentials = {
  #     # Amazon S3用の設定
  #     :provider: 'AWS',
  #     :region: 'ap-northeast-1',
  #     :aws_access_key_id: ENV['AWS_IAM_ACCESS_KEY_ID'],
  #     :aws_secret_access_key => ENV['AWS_IAM_ACCESS_KEY']
  #   }
  #   config.fog_directory = ''
  #   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/golfgearreview'
  # end
end