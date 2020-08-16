class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments,foreign_key: :post_id, dependent: :destroy
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
