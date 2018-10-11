CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJNXQBHRWHLT4ZKAA',
    aws_secret_access_key: '6IpVw4yaWcVpNbEho/2/g4UUNLXYGJjJKaI+ZQz',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'playcal-picture'
  config.cache_storage = :fog
end
