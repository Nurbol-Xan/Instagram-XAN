class Account < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :saveds
  has_many :follows, -> {order(:created_at => :desc)}
  has_many :followings, -> {order(:created_at => :desc)}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 50 }
  
  
  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      nil
    end
  end
  
  def is_follow(account)
    Follow.find_by(account_id: account.id)
  end
end
