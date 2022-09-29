class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  
  validates :account_id, uniqueness: {scope: :post_id}
end
