require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'  #=> 追加
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['AWS_S3_REGION'],     # 例（東京）: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AWS_IAM_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_IAM_ACCESS_KEY']
    }
    config.fog_directory     =  ENV['AWS_S3_BUCKET']
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/golfgearreview'
    # キャッシュの保存期間
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end