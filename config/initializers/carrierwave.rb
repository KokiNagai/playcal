CarrierWave.configure do |config|

   case Rails.env
     when 'production'
      config.fog_credentials = {
      provider:                'AWS',
      aws_access_key_id: "AKIAJNXQBHRWHLT4ZKAA",
      aws_secret_access_key: "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",
      region:                  'ap-northeast-1'
     }
       config.fog_directory = 'playcal-picture'
       
       config.cache_storage = :fog

     when 'staging'
      config.fog_credentials = {
        provider:                'AWS',
        aws_access_key_id: "AKIAJNXQBHRWHLT4ZKAA",
        aws_secret_access_key: "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",
        region:                  'ap-northeast-1'
    }
       config.fog_directory = 'playcal-picture'
       config.asset_host = 'https://s3.console.aws.amazon.com/s3/buckets/playcal-picture/uploads/tmp/?region=us-east-1&tab=overview'
   end
 end
