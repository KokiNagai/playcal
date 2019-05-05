CarrierWave.configure do |config|

   case Rails.env
     when 'production'
      config.fog_credentials = {
      provider:                'AWS',
      aws_access_key_id: "your_key",
      aws_secret_access_key: "your_key",
      region:                  'ap-northeast-1'
     }
       config.fog_directory = 'your_directory'

       config.cache_storage = :fog

     when 'staging'
      config.fog_credentials = {
        provider:                'AWS',
        aws_access_key_id: "your_key",
        aws_secret_access_key: "your_key",
        region:                  'ap-northeast-1'
    }
       config.fog_directory = 'your_directory'
       config.asset_host = 'your_asset_host'
   end
 end
