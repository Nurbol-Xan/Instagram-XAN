class Post < ApplicationRecord
  belongs_to :account
  has_many :photos, dependent: :destroy
  has_many :comments, -> {order(:created_at => :desc)}
  has_many :likes, -> {order(:created_at => :desc)}
  has_many :saveds

  def is_liked account
    Like.find_by(account_id: account.id, post_id: id)
  end
  
  def is_saved account
    Saved.find_by(account_id: account.id, post_id: id)
  end
end
