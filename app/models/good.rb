class Good < ApplicationRecord
  belongs_to :user
  belongs_to :chat, counter_cache: :goods_count
end
